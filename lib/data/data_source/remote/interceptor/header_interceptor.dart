import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_base/data/data_source/local/pref/app_pref.dart';
import 'package:get_it/get_it.dart';
import 'package:package_info/package_info.dart';

class HeaderInterceptor extends QueuedInterceptorsWrapper {
  final String userAgentKey = 'User-Agent';
  final String authHeaderKey = 'Authorization';
  final String bearer = 'Bearer';

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // final userAgentValue = await userAgentHintHeader();
    final appPref = await GetIt.I.getAsync<AppPref>();
    final String? token = await appPref.getToken();
    // if (token?.isNotEmpty == true) {
    //   options.headers[authHeaderKey] = '$bearer $token';
    // }
    // options.headers[userAgentKey] = userAgentValue;
    handler.next(options);
  }

  Future<String> userAgentHintHeader() async {
    try {
      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      return '${Platform.operatingSystem} - ${packageInfo.buildNumber}';
    } catch (e) {
      return 'Platform not support get info';
    }
  }
}
