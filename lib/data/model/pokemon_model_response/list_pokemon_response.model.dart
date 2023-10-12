import 'package:flutter_base/data/model/pokemon_model_response/pokemon.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_pokemon_response.model.freezed.dart';
part 'list_pokemon_response.model.g.dart';

@freezed
class ListPokemonResponseModel with _$ListPokemonResponseModel {
  const factory ListPokemonResponseModel({
    int? count,
    String? next,
    String? previous,
    @Default([]) List<PokemonModel>? results,
  }) = _ListPokemonResponseModel;

  factory ListPokemonResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListPokemonResponseModelFromJson(json);
}
