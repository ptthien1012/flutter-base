import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base/core/utils/logger/logger.dart';
import 'package:flutter_base/data/data_source/remote/interceptor/header_interceptor.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkApiService {
  static late Dio dio;

  Dio init() {
    try {
      dio = Dio(
        BaseOptions(
          baseUrl: '${dotenv.get('BASE_URL')}${dotenv.get('VERSION_CODE')}',
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          headers: {'Accept': 'application/json'},
          contentType: 'application/json',
        ),
      );

      // Interceptor header dio
      dio.interceptors.add(HeaderInterceptor());

      // Interceptor dio log
      dio.interceptors.add(AwesomeDioInterceptor());

      return dio;
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}
