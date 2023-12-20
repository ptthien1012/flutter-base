import 'package:dio/dio.dart';
import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/data/data_source/remote/queries/list_pokemon_query.model.dart';
import 'package:flutter_base/data/model/pokemon_model_response/list_pokemon_response.model.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_data_source.g.dart';

@RestApi()
abstract class PokemonDataSource {
  factory PokemonDataSource() {
    final dio = getIt.get<Dio>();
    return _PokemonDataSource(dio);
  }

  @GET("/pokemon")
  Future<HttpResponse<ListPokemonResponseModel>> getPokemon(
      @Queries() ListPokemonQueryModel query);
}
