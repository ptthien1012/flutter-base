import 'package:flutter_base/data/remote/network/network_api_service.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> initializeDependencies() async {
  getIt
    ..registerSingleton<NetworkApiService>(NetworkApiService()..init())
    ..registerSingleton<ArtRepositoryImpl>(
      ArtRepositoryImpl(
        baseApiService: getIt.get<NetworkApiService>(),
      ),
    );
}
