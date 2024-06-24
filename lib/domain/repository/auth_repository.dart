import 'package:flutter_base/core/utils/data/data_state.dart';

abstract class AuthRepository {
  Future<DataState<String>> refreshToken();
}
