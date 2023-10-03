import 'package:freezed_annotation/freezed_annotation.dart';
part 'list_pokemon_query.model.freezed.dart';
part 'list_pokemon_query.model.g.dart';

@freezed
class ListPokemonQueryModel with _$ListPokemonQueryModel {
  const factory ListPokemonQueryModel({
    required int offset,
    @Default(20) int? limit,
  }) = _ListPokemonQueryModel;

  factory ListPokemonQueryModel.fromJson(Map<String, dynamic> json) =>
      _$ListPokemonQueryModelFromJson(json);
}
