import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/core/utils/data/data_state.dart';
import 'package:flutter_base/data/data_source/remote/base/base_api_response.dart';
import 'package:flutter_base/data/data_source/remote/network/art_data_source.dart';
import 'package:flutter_base/data/data_source/remote/response/art_work_response.model.dart';
import 'package:flutter_base/domain/repository/art_repository.dart';

class ArtRepositoryImpl extends BaseApiResponse implements ArtRepository {
  ArtRepositoryImpl();
  final ArtDataSource _artDataSource = getIt.get<ArtDataSource>();
  @override
  Future<DataState<ArtWorkResponseModel>> fetchArts(
      {required int page, required int limit}) {
    return getStateOf(
      request: () => _artDataSource.getArtWorks(
        limit: limit,
        page: page,
      ),
    );
  }
}
