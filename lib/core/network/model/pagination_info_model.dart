import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rickandmorty/core/network/domain/entity/pagination.dart';

part 'pagination_info_model.freezed.dart';
part 'pagination_info_model.g.dart';

@freezed
abstract class PaginationInfoModel with _$PaginationInfoModel {
  const factory PaginationInfoModel({
    required int count,
    required int pages,
    String? next,
    String? prev,
  }) = _PaginationInfoModel;

  factory PaginationInfoModel.fromJson(Map<String, dynamic> json) => _$PaginationInfoModelFromJson(json);
}

extension PaginationInfoModelMapper on PaginationInfoModel {
  Pagination toEntity() => Pagination(
    count: count,
    pages: pages,
    next: next,
    prev: prev,
  );
}
