import 'package:dio/dio.dart';
import 'package:flutter_base/core/util/logger/logger.dart';
import 'package:flutter_base/data/data_source/remote/network/network_api_service.dart';
import 'package:flutter_base/data/model/response/art.model.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.dart';
import 'package:get_it/get_it.dart';

class ArtRepositoryImpl extends ArtRepository {
  ArtRepositoryImpl({required NetworkApiService baseApiService})
      : _apiService = baseApiService;

  final NetworkApiService _apiService;

  @override
  Future<List<Art>> getArts({required int page, required int limit}) async {
    try {
      dynamic response = await GetIt.I.get<Dio>();
      if (response != null) {
        final listData = (response['data'] as List)
            .map((item) => Art.fromJson(item))
            .toList();
        return listData;
      }

      return [];
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}
