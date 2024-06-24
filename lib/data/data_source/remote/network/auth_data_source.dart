import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_data_source.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class AuthDataSource {
  factory AuthDataSource(Dio dio, {String baseUrl}) = _AuthDataSource;

  @POST('/auth/refresh-token')
  Future<HttpResponse<String>> refreshToken();
}
