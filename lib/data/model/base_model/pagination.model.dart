import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.model.freezed.dart';
part 'pagination.model.g.dart';

@freezed
class Pagination with _$Pagination {
  const factory Pagination({
    @JsonKey(defaultValue: 0) int? total,
    @JsonKey(defaultValue: 0) int? limit,
    @JsonKey(defaultValue: 0, name: 'total_pages') int? totalPage,
    @JsonKey(defaultValue: 0, name: 'current_page') int? currentPage,
    @JsonKey(defaultValue: '', name: 'next_url') String? nextUrl,
  }) = _Pagination;

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
