import 'package:dio/dio.dart';
import 'package:flutter_base/core/util/logger/logger.dart';
import 'package:flutter_base/data/remote/app_exception.dart';
import 'package:flutter_base/data/remote/network/base_api_service.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkApiService extends BaseApiService {
  NetworkApiService();

  static late Dio dio;

  Future<void> init() async {
    await dotenv.load(fileName: 'assets/env/.env');
    dio = Dio(
      BaseOptions(
        baseUrl: '${dotenv.get('BASE_URL')}${dotenv.get('VERSION_CODE')}',
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
      ),
    );
  }

  @override
  Future deleteResponse(String url, {header, id, body}) async {
    dynamic responseJson;
    try {
      final response = await dio.delete(
        id != null ? '$url/$id' : url,
        options: Options(
          headers: header,
          contentType: Headers.jsonContentType,
        ),
        data: body,
      );

      responseJson = returnResponse(response);
    } on DioError catch (exception) {
      handleException(exception);
    }
    return responseJson;
  }

  @override
  Future getResponse(
    String url, {
    header,
    String? function,
    Map<String, dynamic>? queryParameters,
  }) async {
    dynamic responseJson;
    try {
      final response = await dio.get(function == null ? url : '$url/$function',
          options: Options(
            headers: header,
            contentType: Headers.jsonContentType,
          ),
          queryParameters: queryParameters);
      logger.i(response);
      responseJson = await returnResponse(response);
    } on DioError catch (exception) {
      handleException(exception);
    }

    return responseJson;
  }

  @override
  Future getResponseByID(
    String url, {
    header,
    String? function,
    id,
  }) async {
    dynamic responseJson;
    try {
      final response = await dio.get(
        function == null ? '$url/$id' : '$url/$function/$id',
        options: Options(
          headers: header,
          contentType: Headers.jsonContentType,
        ),
      );

      responseJson = returnResponse(response);
    } on DioError catch (exception) {
      handleException(exception);
    }
    return responseJson;
  }

  @override
  Future postResponse(String url, {header, String? function, body}) async {
    dynamic responseJson;
    try {
      final response = await dio.post(
        function == null ? url : '$url/$function',
        options: Options(
          headers: header,
          contentType: Headers.jsonContentType,
        ),
        data: body,
      );
      responseJson = returnResponse(response);
    } on DioError catch (exception) {
      handleException(exception);
    }
    return responseJson;
  }

  @override
  Future putResponse(String url, {header, String? function, id, body}) async {
    dynamic responseJson;

    try {
      final response = await dio.put(id != null
          ? (function == null ? '$url/$id' : '$url/$function/$id')
          : url);
      responseJson = returnResponse(response);
    } on DioError catch (exception) {
      handleException(exception);
    }
    return responseJson;
  }

  void handleException(DioError exception) {
    if (exception.type == DioErrorType.unknown) {
      throw FetchDataException('No Internet connection');
    }
    if (exception.type == DioErrorType.connectionTimeout ||
        exception.type == DioErrorType.receiveTimeout ||
        exception.type == DioErrorType.sendTimeout) {
      throw FetchDataException('Fail to connect to server');
    }
    if (exception.type == DioErrorType.badResponse) {
      returnResponse(exception.response!);
    }
  }

  dynamic returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
        return response.data;

      case 400:
        return BadRequestException(response.toString());

      case 401:
        return UnAuthorizedException(response.toString());

      case 404:
        return NotFoundException(response.toString());

      case 409:
        return ConflictException(response.toString());

      case 500:
        return InternalServerException(response.toString());
      default:
        throw FetchDataException(
          'Error occurred while communication with server with status code : ${response.statusCode}',
        );
    }
  }

  @override
  Future downloadFile(String url, {required header, id, String? function}) {
    // TODO: implement downloadFile
    throw UnimplementedError();
  }

  // @override
  // Future downloadListFiles(String url,
  //     {required header, List listId, String? function}) {
  //   // TODO: implement downloadListFiles
  //   throw UnimplementedError();
  // }

  @override
  Future uploadFile(String url,
      {header, String? function, required String filePath}) {
    // TODO: implement uploadFile
    throw UnimplementedError();
  }
}
