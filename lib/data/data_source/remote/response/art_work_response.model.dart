import 'package:flutter_base/data/model/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'art_work_response.model.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ArtWorkResponseModel {
  @JsonKey(name: 'data', defaultValue: [])
  final List<Art>? artworks;
  final Pagination? pagination;
  ArtWorkResponseModel({
    this.artworks,
    this.pagination,
  });

  factory ArtWorkResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ArtWorkResponseModelFromJson(json);
}
