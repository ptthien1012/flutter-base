import 'package:flutter_base/core/util/data/data_state.dart';
import 'package:flutter_base/data/model/pokemon_model_response/pokemon.model.dart';

abstract class PokemonRepository {
  Future<DataState<PokemonModel>> fetchPokemon(
      {required int offset, int limit = 20});
}
