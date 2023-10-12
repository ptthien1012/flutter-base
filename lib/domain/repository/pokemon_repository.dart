import 'package:flutter_base/core/util/data/data_state.dart';
import 'package:flutter_base/data/model/pokemon_model_response/list_pokemon_response.model.dart';
import 'package:flutter_base/data/model/pokemon_model_response/pokemon.model.dart';

abstract class PokemonRepository {
  Future<DataState<ListPokemonResponseModel>> fetchPokemon(
      {required int offset, int limit = 20});
}
