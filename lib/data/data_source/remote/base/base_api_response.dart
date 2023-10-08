import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_base/core/utils/data/data_state.dart';
import 'package:retrofit/retrofit.dart';

abstract class BaseApiResponse {
  @protected
  Future<DataState<T>> getStateOf<T>({
    required Future<HttpResponse<T>> Function() request,
  }) async {
    try {
      final httpResponse = await request();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        throw DioError(
            response: httpResponse.response,
            requestOptions: httpResponse.response.requestOptions);
      }
    } on DioError catch (error) {
      return DataFailed(error);
    }
  }
}
