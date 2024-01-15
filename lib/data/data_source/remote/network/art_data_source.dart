import 'package:dio/dio.dart';
import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/data/data_source/remote/response/art_work_response.model.dart';
import 'package:retrofit/retrofit.dart';

part 'art_data_source.g.dart';

@RestApi(parser: Parser.JsonSerializable)
abstract class ArtDataSource {
  factory ArtDataSource() {
    final dio = getIt.get<Dio>();
    return _ArtDataSource(dio);
  }

  @GET('/images')
  Future<HttpResponse<ArtWorkResponseModel>> getArtWorks({
    @Query('id') required int page,
    @Query('limit') required int limit,
  });
}
