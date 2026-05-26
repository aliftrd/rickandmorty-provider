import 'package:rickandmorty/core/network/domain/entity/pagination.dart';

class PaginatedResult<T> {
  final Pagination info;
  final List<T> results;

  const PaginatedResult({
    required this.info,
    required this.results,
  });
}
