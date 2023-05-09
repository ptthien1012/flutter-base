import 'package:flutter_base/data/model/art.model.dart';

abstract class ArtRepository {
  Future<List<Art>> fetchArts({required int page, required int limit});
}
