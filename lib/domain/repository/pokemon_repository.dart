import 'package:flutter_base/core/utils/data/data_state.dart';
import 'package:flutter_base/data/model/pokemon_model_response/list_pokemon_response.model.dart';

abstract class PokemonRepository {
  Future<DataState<ListPokemonResponseModel>> fetchPokemon(
      {required int offset, int limit = 20});
}
