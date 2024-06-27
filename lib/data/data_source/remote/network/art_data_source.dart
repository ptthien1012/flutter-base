import 'package:dio/dio.dart';
import 'package:flutter_base/data/data_source/remote/response/art_work_response.model.dart';
import 'package:retrofit/retrofit.dart';

part 'art_data_source.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class ArtDataSource {
  factory ArtDataSource(Dio dio, {String baseUrl}) = _ArtDataSource;

  @GET('/curated')
  Future<HttpResponse<ArtWorkResponseModel>> getArtWorks({
    @Query('page') required int page,
    @Query('per_page') required int perPage,
  });
}
