import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_base/core/utils/logger/logger.dart';
import 'package:flutter_base/data/data_source/remote/interceptor/dio_retry_interceptor.dart';

import 'package:flutter_base/data/data_source/remote/interceptor/header_interceptor.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkApiService {
  static late Dio dio;

  Future<Dio> buildDioClient(
      {required String baseUrl, required String versionCode}) async {
    try {
      final dio = Dio()
        ..options = BaseOptions(
          baseUrl: '$baseUrl/$versionCode}',
          receiveDataWhenStatusError: true,
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
          headers: {'Accept': 'application/json'},
          contentType: 'application/json',
        );

      // Interceptor header dio
      dio.interceptors.addAll([
        HeaderInterceptor(),
        AwesomeDioInterceptor(),
        DioRetryInterceptor(dio: dio),
      ]);

      return dio;
    } on DioException catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}
