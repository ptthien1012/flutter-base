import 'package:json_annotation/json_annotation.dart';

part 'base_response.model.g.dart';

@JsonSerializable()
class BaseResponse {
  final String? data;
  BaseResponse({this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json) =>
      _$BaseResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}
