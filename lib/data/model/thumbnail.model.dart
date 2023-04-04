import 'package:freezed_annotation/freezed_annotation.dart';

part 'thumbnail.model.freezed.dart';
part 'thumbnail.model.g.dart';

@freezed
class Thumbnail with _$Thumbnail {
  const factory Thumbnail({
    required String lqip,
    required int width,
    required int height,
    required String altText,
  }) = _Thumbnail;

  factory Thumbnail.fromJson(Map<String, dynamic> json) =>
      _$ThumbnailFromJson(json);
}
