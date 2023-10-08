import 'package:dio/dio.dart';
import 'package:flutter_base/data/data_source/local/app_storage.dart';
import 'package:flutter_base/data/data_source/local/pref/app_pref.dart';
import 'package:flutter_base/data/data_source/remote/network/art_data_source.dart';
import 'package:flutter_base/data/data_source/remote/network/network_api_service.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.dart';
import 'package:flutter_base/domain/repository/art_repository.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> initializeDependencies() async {
  getIt
    ..registerSingletonAsync<AppPref>(AppStorage.init().prefHelper)
    ..registerSingleton<Dio>(NetworkApiService().init());

  // Service initialization
  getIt
    ..registerSingleton<ArtDataSource>(ArtDataSource(getIt<Dio>()))
    ..registerSingleton<ArtRepository>(
        ArtRepositoryImpl(getIt<ArtDataSource>()));
}
