import 'package:freezed_annotation/freezed_annotation.dart';

import '../art.model.dart';

part 'get_list_arts_response.model.g.dart';

@JsonSerializable()
class GetListArtsResponse {
  final Art? listArt;
  GetListArtsResponse({this.listArt});

  factory GetListArtsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListArtsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetListArtsResponseToJson(this);
}
