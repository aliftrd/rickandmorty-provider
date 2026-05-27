import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rickandmorty/core/theme/app_theme.dart';
import 'package:rickandmorty/feature/character/domain/entity/character.dart';
import 'package:rickandmorty/shared/custom_scaffold.dart';

@RoutePage()
class CharacterDetailScreen extends StatelessWidget {
  final Character character;

  const CharacterDetailScreen({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: AppBar(
        title: Text(character.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Center(
            child: Column(
              spacing: 16,
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundColor: Colors.grey[200],
                  child: SizedBox(
                    width: 200,
                    height: 200,
                    child: CachedNetworkImage(
                      imageUrl: character.image,
                      imageBuilder: (context, imageProvider) => CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.grey[200],
                        backgroundImage: imageProvider,
                      ),
                      placeholder: (context, url) => Center(
                        child: CircularProgressIndicator.adaptive(
                          backgroundColor: Colors.grey[200],
                        ),
                      ),
                      errorWidget: (context, url, error) => Icon(Icons.error, size: 40),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  decoration: AppTheme.boxDecoration,
                  child: Column(
                    crossAxisAlignment: .stretch,
                    children: [
                      Text('Detail'),
                      Column(
                        spacing: 8,
                        children: [
                          Text('Name: ${character.name}'),
                          Text('Gender: ${character.gender}'),
                          Text('Spesies: ${character.species}'),
                          Text('Status: ${character.status}'),
                          Text('Jumlah Eps: ${character.episode.length}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
