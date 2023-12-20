import 'package:dio/dio.dart';
import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/data/data_source/remote/queries/list_country_query.model.dart';
import 'package:flutter_base/data/data_source/remote/response/list_country_detail_response.model.dart';
import 'package:retrofit/retrofit.dart';

part 'weather_data_source.g.dart';

@RestApi()
abstract class WeatherDataSource {
  factory WeatherDataSource() {
    final dio = getIt.get<Dio>();
    return _WeatherDataSource(dio);
  }

  @GET("/search.json")
  Future<HttpResponse<ListCountryDetailResponseModel>> searchCountry(
      @Queries() ListCountryQueryModel query);
}
