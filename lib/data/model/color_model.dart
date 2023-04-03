import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_model.freezed.dart';

@freezed
class Color with _$Color {
  const factory Color({
    required int h,
    required int l,
    required int s,
    required double percentage,
    required int population,
  }) = _Color;

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);
}
