import 'package:flutter/foundation.dart';
import 'package:flutter_base/data/model/art.model.dart';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_list_arts_response.model.g.dart';

@JsonSerializable()
class GetListArtsResponse {
  @Key("data")
  final List<Art>? listArt;
  GetListArtsResponse({this.listArt});

  factory GetListArtsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetListArtsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetListArtsResponseToJson(this);
}
