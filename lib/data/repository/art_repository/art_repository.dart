import 'package:dio/dio.dart';
import 'package:flutter_base/data/data_source/remote/base/base_api_response.dart';
import 'package:flutter_base/data/data_source/remote/network/art_data_source.dart';
import 'package:flutter_base/data/data_source/remote/response/art_work_response.model.dart';
import 'package:flutter_base/domain/repository/art_repository.dart';
import 'package:get_it/get_it.dart';

class ArtRepositoryImpl extends BaseApiResponse implements ArtRepository {
  final ArtDataSource _artDataSource;
  ArtRepositoryImpl(this._artDataSource);
  @override
  Future<ArtWorkResponseModel> fetchArts(
      {required int page, required int limit}) {
    return getStateOf<ArtWorkResponseModel>(
      request: () => _artDataSource.getArtWorks(),
    );
  }
}
