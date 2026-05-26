import 'package:fpdart/fpdart.dart';
import 'package:rickandmorty/core/network/domain/entity/paginated_result.dart';
import 'package:rickandmorty/feature/character/domain/entity/character.dart';

abstract interface class CharacterRepository {
  Future<Either<String, PaginatedResult<Character>>> getCharacters({
    int page = 1,
    String? name,
  });
}
