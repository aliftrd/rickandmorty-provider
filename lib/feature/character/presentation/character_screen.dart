import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/core/di/injector.dart';
import 'package:rickandmorty/core/theme/app_color.dart';
import 'package:rickandmorty/core/theme/app_theme.dart';
import 'package:rickandmorty/feature/character/domain/entity/character.dart';
import 'package:rickandmorty/feature/character/presentation/character_provider.dart';
import 'package:rickandmorty/shared/custom_scaffold.dart';
import 'package:skeletonizer/skeletonizer.dart';

@RoutePage()
class CharacterScreen extends StatefulWidget implements AutoRouteWrapper {
  const CharacterScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<CharacterProvider>()..getCharacters(),
      child: this,
    );
  }

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {
  late final ScrollController _scrollController = ScrollController();
  Timer? _searchDebounce;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      context.read<CharacterProvider>().getCharacters(loadMore: true);
    }
  }

  @override
  void dispose() {
    _searchDebounce?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    _searchDebounce?.cancel();
    _searchDebounce = Timer(const Duration(milliseconds: 500), () {
      if (!mounted) return;
      context.read<CharacterProvider>().getCharacters(name: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text('Characters'),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            color: blackColor,
            height: 2.5,
          ),
        ),
      ),
      body: _CharacterErrorSnackBarListener(
        child: SafeArea(
          child: RefreshIndicator(
            onRefresh: () async => context.read<CharacterProvider>().getCharacters(),
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Selector<CharacterProvider, ({List<Character> characters, CharacterState state, bool isLoadingMore, String searchName})>(
                selector: (_, provider) => (
                  characters: provider.characters,
                  state: provider.state,
                  isLoadingMore: provider.isLoadingMore,
                  searchName: provider.searchName,
                ),
                builder: (context, data, child) {
                  return Column(
                    spacing: 16,
                    children: [
                      TextField(
                        onChanged: _onSearchChanged,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Search',
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      if (data.characters.isEmpty && data.state != CharacterState.loading)
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: AppTheme.boxDecoration,
                          child: Center(
                            child: Text(
                              data.searchName.isEmpty ? 'No characters found' : 'No results for "${data.searchName}"',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                          ),
                        )
                      else
                        ListView.separated(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: data.characters.length,
                          separatorBuilder: (context, index) => const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final character = data.characters[index];
                            return Skeletonizer(
                              enabled: data.state == CharacterState.loading,
                              child: Container(
                                decoration: AppTheme.boxDecoration,
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                child: Row(
                                  spacing: 16,
                                  children: [
                                    CircleAvatar(
                                      radius: 24,
                                      backgroundColor: Colors.grey[200],
                                      child: CachedNetworkImage(
                                        imageUrl: character.image,
                                        imageBuilder: (context, imageProvider) => CircleAvatar(
                                          radius: 24,
                                          backgroundColor: Colors.grey[200],
                                          backgroundImage: imageProvider,
                                        ),
                                        placeholder: (context, url) => CircularProgressIndicator.adaptive(
                                          backgroundColor: Colors.grey[200],
                                        ),
                                        errorWidget: (context, url, error) => Icon(Icons.error, size: 20),
                                      ),
                                    ),

                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Skeleton.leaf(
                                            child: Row(
                                              mainAxisSize: MainAxisSize.min,
                                              spacing: 4,
                                              children: [
                                                Flexible(
                                                  child: Text(
                                                    character.name,
                                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
                                                    overflow: TextOverflow.ellipsis,
                                                  ),
                                                ),
                                                Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(16),
                                                    color: character.status == 'Alive'
                                                        ? greenColor
                                                        : character.status == 'Dead'
                                                        ? redColor
                                                        : warningColor,
                                                  ),
                                                  child: Text(
                                                    character.status,
                                                    style: Theme.of(context).textTheme.bodySmall?.copyWith(color: blackColor),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(character.species),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      if (data.isLoadingMore) ...[
                        const SizedBox(height: 12),
                        const Center(child: CircularProgressIndicator.adaptive()),
                        const SizedBox(height: 12),
                      ],
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CharacterErrorSnackBarListener extends StatefulWidget {
  const _CharacterErrorSnackBarListener({required this.child});

  final Widget child;

  @override
  State<_CharacterErrorSnackBarListener> createState() => _CharacterErrorSnackBarListenerState();
}

class _CharacterErrorSnackBarListenerState extends State<_CharacterErrorSnackBarListener> {
  String? _lastShownError;

  @override
  Widget build(BuildContext context) {
    final errorMessage = context.select<CharacterProvider, String?>(
      (provider) => provider.state == CharacterState.error && provider.errorMessage.isNotEmpty ? provider.errorMessage : null,
    );

    if (errorMessage == null) {
      _lastShownError = null;
    } else if (errorMessage != _lastShownError) {
      _lastShownError = errorMessage;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!mounted) return;
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(SnackBar(content: Text(errorMessage)));
      });
    }

    return widget.child;
  }
}
