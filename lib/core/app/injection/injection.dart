import 'package:flutter_base/data/data_source/remote/network/art_data_source.dart';
import 'package:flutter_base/data/data_source/remote/network/network_api_service.dart';
import 'package:flutter_base/data/data_source/remote/network/pokemon_data_source.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.dart';
import 'package:flutter_base/data/repository/pokemon_repository/pokemon_repository_impl.dart';
import 'package:flutter_base/domain/repository/art_repository.dart';
import 'package:flutter_base/domain/repository/pokemon_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> initializeDependencies() async {
  final dio = await NetworkApiService()
      .buildDioClient(baseUrl: 'http://google.com', versionCode: '12');

  getIt
    // ..registerSingletonAsync<AppPref>(AppStorage.init().prefHelper)
    // Init DioService

    // Register dataSource
    ..registerLazySingleton<ArtDataSource>(() => ArtDataSource(dio))

    // Register repository
    ..registerLazySingleton<PokemonRepository>(PokemonRepositoryImpl.new)
    ..registerLazySingleton<ArtRepository>(ArtRepositoryImpl.new);
}
