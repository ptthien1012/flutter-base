import 'package:flutter_base/data/model/response/art.model.dart';

abstract class ArtRepository {
  ArtRepository();

  Future<List<Art?>> getArts({required int page, required int limit});
}
