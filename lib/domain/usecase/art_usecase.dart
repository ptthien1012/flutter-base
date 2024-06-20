import 'package:flutter_base/core/utils/data/data_state.dart';
import 'package:flutter_base/data/data_source/remote/response/art_work_response.model.dart';
import 'package:flutter_base/domain/repository/art_repository.dart';

class ArtUseCase {
  ArtUseCase(this.repository);
  final ArtRepository repository;

  Future<DataState<ArtWorkResponseModel>> getArtWork(
      {required int page, required int limit}) async {
    return repository.fetchArts(page: page, limit: limit);
  }
}
