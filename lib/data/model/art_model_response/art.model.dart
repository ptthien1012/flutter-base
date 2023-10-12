import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'art.model.freezed.dart';
part 'art.model.g.dart';

Art artFromJson(String str) => Art.fromJson(json.decode(str));

String artToJson(Art data) => json.encode(data.toJson());

@freezed
class Art with _$Art {
  const factory Art({
    String? url,
  }) = _Art;

  factory Art.fromJson(Map<String, dynamic> json) => _$ArtFromJson(json);
}
