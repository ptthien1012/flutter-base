import 'package:flutter_base/data/model/models.dart';
import 'package:flutter_base/data/repository/api_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'art_work_response.model.g.dart';

@JsonSerializable(createToJson: false, checked: true)
class ArtWorkResponseModel extends ApiResponse {
  @JsonKey(name: 'data', defaultValue: [])
  final List<Art>? artworks;

  ArtWorkResponseModel({this.artworks}) : super(data: artworks);

  factory ArtWorkResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ArtWorkResponseModelFromJson(json);
}
