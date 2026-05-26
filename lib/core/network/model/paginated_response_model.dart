import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickandmorty/core/network/model/pagination_info_model.dart';

part 'paginated_response_model.freezed.dart';
part 'paginated_response_model.g.dart';

@Freezed(genericArgumentFactories: true)
abstract class PaginatedResponseModel<T> with _$PaginatedResponseModel<T> {
  const factory PaginatedResponseModel({
    required PaginationInfoModel info,
    required List<T> results,
  }) = _PaginatedResponseModel<T>;

  factory PaginatedResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) => _$PaginatedResponseModelFromJson(json, fromJsonT);
}
