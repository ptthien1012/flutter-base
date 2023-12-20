import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_country_query.model.freezed.dart';
part 'list_country_query.model.g.dart';

@freezed
class ListCountryQueryModel with _$ListCountryQueryModel {
  const factory ListCountryQueryModel({
    required String key,
    @Key('q') String? q,
  }) = _ListCountryQueryModel;

  factory ListCountryQueryModel.fromJson(Map<String, dynamic> json) =>
      _$ListCountryQueryModelFromJson(json).copyWith(q: json['q'] as String?);
}
