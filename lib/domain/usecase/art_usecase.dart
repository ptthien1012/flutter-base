import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/utils/data/data_state.dart';
import 'package:flutter_base/domain/entities/art.dart';
import 'package:flutter_base/domain/entities/error_data.dart';
// import 'package:flutter_base/data/model/art_model_response/art.model.dart';
import 'package:flutter_base/domain/repository/art_repository.dart';

class ArtUseCase {
  ArtUseCase(this.repository);
  final ArtRepository repository;

  Future<Either<ErrorData, Art>> call(
      {required int page, required int limit}) async {
    final data = await repository.fetchArts(page: page, perPage: limit);
    if (data is DataSuccess) {
      return right(Art(url: data.data?.data[0].url));
    } else {
      return left(ErrorData(
          messages: data is DataFailed
              ? data.error?.message
              : 'Failed to fetch data'));
    }
  }
}
