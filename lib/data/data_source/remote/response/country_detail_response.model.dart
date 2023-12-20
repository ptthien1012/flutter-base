import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_detail_response.model.freezed.dart';
part 'country_detail_response.model.g.dart';

@freezed
class CountryDetailResponseModel with _$CountryDetailResponseModel {
  const factory CountryDetailResponseModel({
    @Default('') String id,
    @Default('') String name,
    @Default('') String region,
    @Default('') String country,
    @Default(0) double lat,
    @Default(0) double lon,
  }) = _CountryDetailResponseModel;

  factory CountryDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CountryDetailResponseModelFromJson(json);
}
