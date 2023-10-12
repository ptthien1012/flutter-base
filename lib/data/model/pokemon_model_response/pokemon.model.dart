import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.model.freezed.dart';
part 'pokemon.model.g.dart';

@freezed
class PokemonModel with _$PokemonModel {
  const factory PokemonModel({
    required String name,
    required String url,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
}
