import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_base/data/data_source/local/pref/app_pref.dart';
import 'package:flutter_base/domain/usecase/auth_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';

class HeaderInterceptor extends QueuedInterceptorsWrapper {
  final String userAgentKey = 'User-Agent';
  final String authHeaderKey = 'Authorization';
  final String bearer = 'Bearer';

  bool _isRefreshing = false;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final userAgentValue = await userAgentHintHeader();
    // final appPref = await GetIt.I.getAsync<AppPref>();
    // final token = await appPref.getToken();
    final token = '';
    if (token.isNotEmpty) {
      options.headers[authHeaderKey] = '$bearer $token';
    }
    options.headers[userAgentKey] = userAgentValue;
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final errorCode = err.response?.data['error_code'];
    if (errorCode == 401 && !_isRefreshing) {
      _isRefreshing = true;
      try {
        await refreshToken();
// calll api again
      } catch (_) {
        _isRefreshing = false;
        handler.next(err);
      }
    }
    // if(error == ErrorCodes.unauthorized) {
    //   // await GetIt.I.getAsync<AppPref>().then((value) => value.clearToken());
    // }

    // Handle signOut
  }

  Future<String> userAgentHintHeader() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      return '${Platform.operatingSystem} - ${packageInfo.buildNumber}';
    } catch (e) {
      return 'Platform not support get info';
    }
  }

  Future<void> refreshToken() async {
    final authUseCase = GetIt.I.get<RefreshTokenUseCase>();

    final result = await authUseCase.call();
    final token = result.fold((error) => '', (token) => token);
    // await set Token;
  }
}
