import 'package:freezed_annotation/freezed_annotation.dart';

part 'camera.model.freezed.dart';
part 'camera.model.g.dart';

@freezed
class CameraModel with _$CameraModel {
  factory CameraModel({
    required double dx,
    required double dy,
    required double lens,
    required double angle,
    required double angleWide,
    required int id,
  }) = _CameraModel;

  factory CameraModel.fromJson(Map<String, dynamic> json) =>
      _$CameraModelFromJson(json);
}
