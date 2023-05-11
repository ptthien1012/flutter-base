import 'package:flutter_base/data/model/art_model_response/art.model.dart';

abstract class ArtRepository {
  ArtRepository();

  Future<List<Art?>> getArts({required int page, required int limit});
}
