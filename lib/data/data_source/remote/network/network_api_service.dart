import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base/core/utils/logger/logger.dart';

import 'package:flutter_base/data/data_source/remote/interceptor/header_interceptor.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkApiService {
  static late Dio dio;

  Future<Dio> init() async {
    try {
      await dotenv.load(fileName: 'assets/env/develop.env');
      dio = Dio(
        BaseOptions(
          baseUrl: '${dotenv.get('BASE_URL')}${dotenv.get('VERSION_CODE')}',
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 5),
          receiveTimeout: const Duration(seconds: 5),
          sendTimeout: const Duration(seconds: 5),
          headers: {'Accept': 'application/json'},
          contentType: 'application/json',
        ),
      );

      // Interceptor header dio
      dio.interceptors.add(HeaderInterceptor());

      // Interceptor dio log
      dio.interceptors.add(AwesomeDioInterceptor());

      return dio;
    } on DioException catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}
