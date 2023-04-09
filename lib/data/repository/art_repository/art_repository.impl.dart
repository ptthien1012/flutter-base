import 'dart:developer';

import 'package:flutter_base/core/util/logger/logger.dart';
import 'package:flutter_base/data/model/art.model.dart';
import 'package:flutter_base/data/remote/network/api_endpoint.dart';
import 'package:flutter_base/data/remote/network/base_api_service.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.dart';

class ArtRepositoryImpl extends ArtRepository {
  ArtRepositoryImpl({required BaseApiService baseApiService})
      : _apiService = baseApiService;

  final BaseApiService _apiService;

  @override
  Future<List<Art>> getArts({required int page, required int limit}) async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndpoint().artworks,
          queryParameters: {'page': page, 'limit': limit});
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
