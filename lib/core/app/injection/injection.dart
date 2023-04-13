import 'package:dio/dio.dart';
import 'package:flutter_base/data/data_source/local/app_storage.dart';
import 'package:flutter_base/data/data_source/local/pref/app_pref.dart';
import 'package:flutter_base/data/data_source/local/pref/pref_helper.dart';
import 'package:flutter_base/data/data_source/remote/network/network_api_service.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> initializeDependencies() async {
  getIt.registerLazySingletonAsync<PrefHelper>(AppStorage.init().prefHelper);

  getIt
    ..registerLazySingletonAsync<Dio>(NetworkApiService().init)
    ..registerSingleton<ArtRepositoryImpl>(
      ArtRepositoryImpl(
        baseApiService: getIt.get<NetworkApiService>(),
      ),
    );
}
