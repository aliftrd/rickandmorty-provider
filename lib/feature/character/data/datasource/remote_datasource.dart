import 'dart:convert';

import 'package:fpdart/fpdart.dart';
import 'package:rickandmorty/core/network/model/paginated_response_model.dart';
import 'package:rickandmorty/core/network/model/pagination_info_model.dart';
import 'package:rickandmorty/feature/character/data/model/character_model.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

abstract interface class RemoteDatasource {
  Future<Either<String, PaginatedResponseModel<CharacterModel>>> getCharacters({
    int page = 1,
    String? name,
  });
}

@Injectable(as: RemoteDatasource)
class RemoteDatasourceImpl implements RemoteDatasource {
  @override
  Future<Either<String, PaginatedResponseModel<CharacterModel>>> getCharacters({
    int page = 1,
    String? name,
  }) async {
    try {
      final queryParameters = <String, String>{'page': '$page'};
      if (name != null && name.trim().isNotEmpty) {
        queryParameters['name'] = name.trim();
      }
      final response = await http.get(
        Uri.parse('https://rickandmortyapi.com/api/character').replace(queryParameters: queryParameters),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        final paginatedResponse = PaginatedResponseModel<CharacterModel>.fromJson(
          data,
          (json) => CharacterModel.fromJson(json! as Map<String, dynamic>),
        );
        return right(paginatedResponse);
      }

      if (response.statusCode == 404 && name != null && name.trim().isNotEmpty) {
        return right(
          const PaginatedResponseModel<CharacterModel>(
            info: PaginationInfoModel(count: 0, pages: 0),
            results: [],
          ),
        );
      }

      return left('Failed to load characters: ${response.statusCode}');
    } catch (e) {
      return left('Failed to load characters: $e');
    }
  }
}
