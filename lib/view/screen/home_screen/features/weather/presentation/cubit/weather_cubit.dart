import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/data/data_source/remote/queries/list_country_query.model.dart';
import 'package:flutter_base/domain/repository/weather_repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());

  final WeatherRepository _weatherRepository = getIt.get<WeatherRepository>();
  Future<void> fetchSearchAutocomplete() async {
    final data = await _weatherRepository.fetchSearchAutocomplete(
        query: ListCountryQueryModel(q: 'Hanoi', key: dotenv.get('API_KEY')));
    print(data);
  }
}
