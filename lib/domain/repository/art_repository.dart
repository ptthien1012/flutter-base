import 'package:flutter_base/core/utils/data/data_state.dart';
import 'package:flutter_base/data/data_source/remote/response/art_work_response.model.dart';

abstract class ArtRepository {
  Future<DataState<ArtWorkResponseModel>> fetchArts(
      {required int page, required int limit});
}
