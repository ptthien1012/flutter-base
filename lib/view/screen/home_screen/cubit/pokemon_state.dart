part of 'pokemon_cubit.dart';

@freezed
class PokemonState with _$PokemonState {
  const factory PokemonState({
    @Default([]) List<PokemonModel> listPokemon,
    @Default(20) int offset,
    @Default([]) List<CameraModel> listCamera,
    CameraModel? selectedCamera,
    @Default(Offset.zero) Offset flagHelper,
  }) = _PokemonState;
}
