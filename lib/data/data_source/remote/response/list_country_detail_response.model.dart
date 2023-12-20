import 'package:flutter_base/data/data_source/remote/response/country_detail_response.model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_country_detail_response.model.freezed.dart';
part 'list_country_detail_response.model.g.dart';

@freezed
class ListCountryDetailResponseModel with _$ListCountryDetailResponseModel {
  const factory ListCountryDetailResponseModel({
    List<CountryDetailResponseModel>? countryDetailResponseModel,
  }) = _ListCountryDetailResponseModel;

  factory ListCountryDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ListCountryDetailResponseModelFromJson(json).copyWith(
          countryDetailResponseModel:
              (json as List<CountryDetailResponseModel>?)
                  ?.map((e) => CountryDetailResponseModel.fromJson(
                      e as Map<String, dynamic>))
                  .toList());
}
