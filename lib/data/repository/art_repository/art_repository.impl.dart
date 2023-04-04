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
  Future<List<Art?>> getArts({required int page, required int limit}) async {
    try {
      dynamic response = await _apiService.getResponse(ApiEndpoint().artworks,
          header: {"accept": "application/json"});
      if (response != null) {
        logger.i(response.toString());
        return [];
      }
      logger.i(response.toString());
      return [];
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}
