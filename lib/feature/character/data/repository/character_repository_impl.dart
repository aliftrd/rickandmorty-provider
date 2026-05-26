import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:rickandmorty/core/network/domain/entity/paginated_result.dart';
import 'package:rickandmorty/core/network/model/pagination_info_model.dart';
import 'package:rickandmorty/feature/character/data/datasource/remote_datasource.dart';
import 'package:rickandmorty/feature/character/data/model/character_model.dart';
import 'package:rickandmorty/feature/character/domain/entity/character.dart';
import 'package:rickandmorty/feature/character/domain/repository/character_repository.dart';

@Injectable(as: CharacterRepository)
class CharacterRepositoryImpl implements CharacterRepository {
  final RemoteDatasource _remoteDatasource;

  CharacterRepositoryImpl(this._remoteDatasource);

  @override
  Future<Either<String, PaginatedResult<Character>>> getCharacters({
    int page = 1,
    String? name,
  }) async {
    final response = await _remoteDatasource.getCharacters(page: page, name: name);
    return response.fold(
      Left.new,
      (r) => Right(
        PaginatedResult(
          info: r.info.toEntity(),
          results: r.results.map((character) => character.toEntity()).toList(),
        ),
      ),
    );
  }
}
