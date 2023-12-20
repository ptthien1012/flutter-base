import 'package:flutter_base/core/utils/data/data_state.dart';
import 'package:flutter_base/data/data_source/remote/queries/list_country_query.model.dart';
import 'package:flutter_base/data/data_source/remote/response/list_country_detail_response.model.dart';

abstract class WeatherRepository {
  Future<DataState<ListCountryDetailResponseModel>> fetchSearchAutocomplete(
      {required ListCountryQueryModel query});
}
