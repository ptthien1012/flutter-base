part of 'pokemon_cubit.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState(
      {@Default([]) List<PokemonModel> listPokemon,
      @Default(20) int offset}) = _PokemonState;
}
