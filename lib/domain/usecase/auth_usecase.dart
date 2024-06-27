import 'package:dartz/dartz.dart';
import 'package:flutter_base/core/utils/data/data_state.dart';
import 'package:flutter_base/domain/entities/error_data.dart';
import 'package:flutter_base/domain/repository/auth_repository.dart';

class RefreshTokenUseCase {
  RefreshTokenUseCase(this.repository);
  final AuthRepository repository;

  Future<Either<ErrorData, String>> call() async {
    final data = await repository.refreshToken();
    if (data is DataSuccess) {
      return right(data.data!);
    } else {
      return left(ErrorData(messages: data.error?.message ?? ''));
    }
  }
}
