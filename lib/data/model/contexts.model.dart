import 'package:freezed_annotation/freezed_annotation.dart';

part 'contexts.model.freezed.dart';
part 'contexts.model.g.dart';

@freezed
class Contexts with _$Contexts {
  const factory Contexts({
    required List<String> groupings,
  }) = _Contexts;

  factory Contexts.fromJson(Map<String, dynamic> json) =>
      _$ContextsFromJson(json);
}
