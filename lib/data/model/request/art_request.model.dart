import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'base_request.model.g.dart';

@JsonSerializable()
class ArtRequest {
  final String? limit;

  @Key('current_page')
  final String? currentPage;

  ArtRequest({this.limit, this.currentPage});

  factory ArtRequest.fromJson(Map<String, dynamic> json) =>
      _$ArtRequestFromJson(json);
}
