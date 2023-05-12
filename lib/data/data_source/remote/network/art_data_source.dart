import 'package:flutter_base/data/data_source/remote/response/art_work_response.model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'art_data_source.g.dart';

@RestApi(parser: Parser.MapSerializable)
abstract class ArtDataSource {
  factory ArtDataSource(Dio dio, {String baseUrl}) = _ArtDataSource;

  @GET("/images")
  Future<ArtWorkResponseModel> getArtWorks();
}
