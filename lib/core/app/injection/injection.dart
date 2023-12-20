import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base/config/service/app_local_notification.dart';
import 'package:flutter_base/data/data_source/local/app_storage.dart';
import 'package:flutter_base/data/data_source/local/pref/app_pref.dart';
import 'package:flutter_base/data/data_source/remote/network/art_data_source.dart';
import 'package:flutter_base/data/data_source/remote/network/network_api_service.dart';
import 'package:flutter_base/data/data_source/remote/network/pokemon_data_source.dart';
import 'package:flutter_base/data/data_source/remote/network/weather_data_source.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.dart';
import 'package:flutter_base/data/repository/pokemon_repository/pokemon_repository_impl.dart';
import 'package:flutter_base/data/repository/weather_repository/weather_repository_impl.dart';
import 'package:flutter_base/domain/repository/art_repository.dart';
import 'package:flutter_base/domain/repository/pokemon_repository.dart';
import 'package:flutter_base/domain/repository/weather_repository.dart';

import 'package:get_it/get_it.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';

final getIt = GetIt.instance;
Future<void> initializeDependencies() async {
  getIt
    ..registerSingletonAsync<AppPref>(AppStorage.init().prefHelper)
    ..registerSingletonAsync<Dio>(NetworkApiService().init)

    // Register dataSource
    ..registerLazySingleton<ArtDataSource>(() => ArtDataSource())
    ..registerLazySingleton<PokemonDataSource>(() => PokemonDataSource())
    ..registerLazySingleton<WeatherDataSource>(() => WeatherDataSource())

    // Register repository
    ..registerLazySingleton<PokemonRepository>(PokemonRepositoryImpl.new)
    ..registerLazySingleton<WeatherRepository>(WeatherRepositoryImpl.new)
    ..registerLazySingleton<ArtRepository>(ArtRepositoryImpl.new);

  // Register bloc observer
  Bloc.observer = TalkerBlocObserver();
}
