import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon.model.g.dart';

@JsonSerializable(explicitToJson: true)
class PokemonModel {
  @Key('name')
  @Default('')
  final String name;
  PokemonModel({required this.name});

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}
