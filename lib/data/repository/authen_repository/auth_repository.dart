import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/core/utils/data/data_state.dart';
import 'package:flutter_base/data/data_source/remote/base/base_api_response.dart';
import 'package:flutter_base/data/data_source/remote/network/auth_data_source.dart';
import 'package:flutter_base/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends BaseApiResponse implements AuthRepository {
  final AuthDataSource _authDataSource = getIt.get<AuthDataSource>();
  @override
  Future<DataState<String>> refreshToken() async {
    return getStateOf(request: _authDataSource.refreshToken);
  }
}
