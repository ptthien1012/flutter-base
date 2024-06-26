import 'package:flutter_base/data/data_source/remote/network/art_data_source.dart';
import 'package:flutter_base/data/data_source/remote/network/auth_data_source.dart';
import 'package:flutter_base/data/data_source/remote/network/network_api_service.dart';
import 'package:flutter_base/data/data_source/remote/network/pokemon_data_source.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.dart';
import 'package:flutter_base/data/repository/authen_repository/auth_repository.dart';
import 'package:flutter_base/data/repository/pokemon_repository/pokemon_repository_impl.dart';
import 'package:flutter_base/domain/repository/art_repository.dart';
import 'package:flutter_base/domain/repository/auth_repository.dart';
import 'package:flutter_base/domain/repository/pokemon_repository.dart';
import 'package:flutter_base/domain/usecase/art_usecase.dart';
import 'package:flutter_base/domain/usecase/auth_usecase.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> initializeDependencies() async {
  // Init DioService
  final dio = await NetworkApiService().buildDioClient(
      baseUrl: dotenv.env['BASE_URL_ART'] ?? '',
      versionCode: dotenv.env['VERSION_CODE_ART'] ?? '');

  getIt
    // Register dataSource
    ..registerLazySingleton<ArtDataSource>(() => ArtDataSource(dio))
    ..registerLazySingleton<AuthDataSource>(() => AuthDataSource(dio))

    // Register repository
    ..registerLazySingleton<PokemonRepository>(PokemonRepositoryImpl.new)
    ..registerLazySingleton<AuthRepository>(AuthRepositoryImpl.new)
    ..registerLazySingleton<ArtRepository>(ArtRepositoryImpl.new)
    // Register UserCase
    ..registerLazySingleton<RefreshTokenUseCase>(
        () => RefreshTokenUseCase(getIt<AuthRepository>()))
    ..registerLazySingleton<ArtUseCase>(
        () => ArtUseCase(getIt<ArtRepository>()));
}
