import 'package:freezed_annotation/freezed_annotation.dart';

part 'color.model.freezed.dart';
part 'color.model.g.dart';

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
