// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paginated_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginatedResponseModel<T> _$PaginatedResponseModelFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) => _PaginatedResponseModel<T>(
  info: PaginationInfoModel.fromJson(json['info'] as Map<String, dynamic>),
  results: (json['results'] as List<dynamic>).map(fromJsonT).toList(),
);

Map<String, dynamic> _$PaginatedResponseModelToJson<T>(
  _PaginatedResponseModel<T> instance,
  Object? Function(T value) toJsonT,
) => <String, dynamic>{
  'info': instance.info,
  'results': instance.results.map(toJsonT).toList(),
};
