import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickandmorty/feature/character/domain/entity/character.dart';

part 'character_model.freezed.dart';
part 'character_model.g.dart';

@freezed
abstract class CharacterModel with _$CharacterModel {
  const factory CharacterModel({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required OriginLocationModel origin,
    required OriginLocationModel location,
    required String image,
    required List<String> episode,
    required String url,
    required String created,
  }) = _CharacterModel;

  factory CharacterModel.fromJson(Map<String, dynamic> json) => _$CharacterModelFromJson(json);
}

@freezed
abstract class OriginLocationModel with _$OriginLocationModel {
  const factory OriginLocationModel({
    required String name,
    required String url,
  }) = _OriginLocationModel;

  factory OriginLocationModel.fromJson(Map<String, dynamic> json) => _$OriginLocationModelFromJson(json);
}

extension CharacterModelExtension on CharacterModel {
  Character toEntity() => Character(
    id: id,
    name: name,
    status: status,
    species: species,
    type: type,
    gender: gender,
    image: image,
    episode: episode,
    url: url,
    created: created,
  );
}
