import 'package:dio/dio.dart';
import 'package:flutter_base/core/util/logger/logger.dart';
import 'package:flutter_base/data/data_source/remote/interceptor/header_interceptor.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkApiService {
  NetworkApiService();

  static late Dio dio;

  Future<Dio> init() async {
    try {
      await dotenv.load(fileName: 'assets/env/.env');
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
      return dio;
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}
