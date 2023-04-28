import 'package:dio/dio.dart';
import 'package:flutter_base/core/util/logger/logger.dart';
import 'package:flutter_base/data/data_source/remote/network/art_data_source.dart';
import 'package:flutter_base/data/data_source/remote/response/art_work_response.model.dart';
import 'package:flutter_base/data/model/art.model.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.dart';
import 'package:get_it/get_it.dart';

class ArtRepositoryImpl extends ArtRepository {
  final artDataSource = ArtDataSource(GetIt.I.get<Dio>());
  @override
  Future<List<Art>> getArts({required int page, required int limit}) async {
    try {
      final ArtWorkResponseModel response = await artDataSource.getArtWorks();
      return response.artworks ?? [];
    } catch (e) {
      logger.e(e.toString());
      rethrow;
    }
  }
}
