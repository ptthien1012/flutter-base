import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/core/util/data/data_state.dart';
import 'package:flutter_base/data/data_source/remote/base/base_api_response.dart';
import 'package:flutter_base/data/data_source/remote/network/pokemon_data_source.dart';
import 'package:flutter_base/data/data_source/remote/queries/list_pokemon_query.model.dart';
import 'package:flutter_base/data/model/pokemon_model_response/list_pokemon_response.model.dart';
import 'package:flutter_base/data/model/pokemon_model_response/pokemon.model.dart';
import 'package:flutter_base/domain/repository/pokemon_repository.dart';

class PokemonRepositoryImpl extends BaseApiResponse
    implements PokemonRepository {
  final PokemonDataSource _pokemonDataSource = getIt.get<PokemonDataSource>();
  @override
  Future<DataState<ListPokemonResponseModel>> fetchPokemon({
    required int offset,
    int? limit,
  }) {
    return getStateOf(
        request: () => _pokemonDataSource.getPokemon(
              ListPokemonQueryModel(
                offset: offset,
                limit: limit,
              ),
            ));
  }
}
