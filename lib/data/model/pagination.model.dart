import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.model.g.dart';

@JsonSerializable(createToJson: true, checked: true)
class PaginationModel {
  @JsonKey(defaultValue: 0)
  final int? total;
  @JsonKey(
    defaultValue: 0,
  )
  final int? limit;
  @JsonKey(defaultValue: 0, name: 'total_pages')
  final int? totalPage;
  @JsonKey(defaultValue: 0, name: 'current_page')
  final int? currentPage;
  @JsonKey(defaultValue: '', name: 'next_url')
  final String? nextUrl;

  PaginationModel({
    this.total,
    this.limit,
    this.totalPage,
    this.currentPage,
    this.nextUrl,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PaginationModelFromJson(json);
}
