import 'package:flutter_base/data/model/contexts_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggest_auto_complete_all_model.freezed.dart';

@freezed
class SuggestAutocompleteAll with _$SuggestAutocompleteAll {
  const factory SuggestAutocompleteAll({
    required List<String> input,
    required Contexts contexts,
    required int weight,
  }) = _SuggestAutocompleteAll;

  factory SuggestAutocompleteAll.fromJson(Map<String, dynamic> json) =>
      _$SuggestAutocompleteAllFromJson(json);
}
