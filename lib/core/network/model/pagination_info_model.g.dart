// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaginationInfoModel _$PaginationInfoModelFromJson(Map<String, dynamic> json) =>
    _PaginationInfoModel(
      count: (json['count'] as num).toInt(),
      pages: (json['pages'] as num).toInt(),
      next: json['next'] as String?,
      prev: json['prev'] as String?,
    );

Map<String, dynamic> _$PaginationInfoModelToJson(
  _PaginationInfoModel instance,
) => <String, dynamic>{
  'count': instance.count,
  'pages': instance.pages,
  'next': instance.next,
  'prev': instance.prev,
};
