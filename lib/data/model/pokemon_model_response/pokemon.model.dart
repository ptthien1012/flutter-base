import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.model.g.dart';
part 'pokemon.model.freezed.dart';

@freezed
abstract class PokemonModel extends Equatable with _$PokemonModel {
  const PokemonModel._();
  const factory PokemonModel({
    String? name,
    String? weight,
  }) = _PokemonModel;

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
  @override
  Map<String, dynamic> toJson() {
    return toJson();
  }

  @override
  List<Object?> get props => [
        name,
        weight,
      ];
}
