import 'package:flutter_base/data/remote/network/network_api_service.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> initializeDependencies() async {
// // Dùng khi instance có thể khởi tạo được ngay
// getIt.registerFactory<HomeBloc>(() => HomeBloc());

// // Dùng khi instance bắt buộc phải tạo dưới dạng bất đồng bộ (asynchronous)
// // hàm createAsync của HomeBloc trả về một Future<HomeBloc>
// getIt.registerFactoryAsync<HomeBloc>(() => HomeBloc.createAsync());

  // Register repository
  getIt
    ..registerSingleton<NetworkApiService>(NetworkApiService()..init())
    ..registerSingleton<ArtRepositoryImpl>(
      ArtRepositoryImpl(
        baseApiService: getIt.get<NetworkApiService>(),
      ),
    );
}
