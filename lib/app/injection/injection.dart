import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
Future<void> configureDependencies() async {
// // Dùng khi instance có thể khởi tạo được ngay
// getIt.registerFactory<HomeBloc>(() => HomeBloc());

// // Dùng khi instance bắt buộc phải tạo dưới dạng bất đồng bộ (asynchronous)
// // hàm createAsync của HomeBloc trả về một Future<HomeBloc>
// getIt.registerFactoryAsync<HomeBloc>(() => HomeBloc.createAsync());
}
