import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/core/utils/data/data_state.dart';
import 'package:flutter_base/data/data_source/remote/base/base_api_response.dart';
import 'package:flutter_base/data/data_source/remote/network/weather_data_source.dart';
import 'package:flutter_base/data/data_source/remote/queries/list_country_query.model.dart';
import 'package:flutter_base/data/data_source/remote/response/list_country_detail_response.model.dart';
import 'package:flutter_base/domain/repository/weather_repository.dart';

class WeatherRepositoryImpl extends BaseApiResponse
    implements WeatherRepository {
  final WeatherDataSource _weatherDataSource = getIt.get<WeatherDataSource>();
  @override
  Future<DataState<ListCountryDetailResponseModel>> fetchSearchAutocomplete(
      {required ListCountryQueryModel query}) {
    return getStateOf<ListCountryDetailResponseModel>(
      request: () => _weatherDataSource.searchCountry(query),
    );
  }
}
