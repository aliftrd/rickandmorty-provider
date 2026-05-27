// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:rickandmorty/feature/character/domain/entity/character.dart'
    as _i5;
import 'package:rickandmorty/feature/character/presentation/character_detail_screen.dart'
    as _i1;
import 'package:rickandmorty/feature/character/presentation/character_screen.dart'
    as _i2;

/// generated route for
/// [_i1.CharacterDetailScreen]
class CharacterDetailRoute extends _i3.PageRouteInfo<CharacterDetailRouteArgs> {
  CharacterDetailRoute({
    _i4.Key? key,
    required _i5.Character character,
    List<_i3.PageRouteInfo>? children,
  }) : super(
         CharacterDetailRoute.name,
         args: CharacterDetailRouteArgs(key: key, character: character),
         initialChildren: children,
       );

  static const String name = 'CharacterDetailRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CharacterDetailRouteArgs>();
      return _i1.CharacterDetailScreen(
        key: args.key,
        character: args.character,
      );
    },
  );
}

class CharacterDetailRouteArgs {
  const CharacterDetailRouteArgs({this.key, required this.character});

  final _i4.Key? key;

  final _i5.Character character;

  @override
  String toString() {
    return 'CharacterDetailRouteArgs{key: $key, character: $character}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CharacterDetailRouteArgs) return false;
    return key == other.key && character == other.character;
  }

  @override
  int get hashCode => key.hashCode ^ character.hashCode;
}

/// generated route for
/// [_i2.CharacterScreen]
class CharacterRoute extends _i3.PageRouteInfo<void> {
  const CharacterRoute({List<_i3.PageRouteInfo>? children})
    : super(CharacterRoute.name, initialChildren: children);

  static const String name = 'CharacterRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i2.CharacterScreen());
    },
  );
}
