import 'package:bloc/bloc.dart';
import 'package:flutter_base/core/app/extension/list_extension.dart';

import 'package:flutter_base/core/util/logger/logger.dart';
import 'package:flutter_base/data/model/models.dart';
import 'package:flutter_base/data/repository/api_repository.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.dart';
import 'package:flutter_base/domain/repository/art_repository.dart';
import 'package:flutter_base/view/cubit/base/cubit_base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_art_state.dart';
part 'get_art_cubit.freezed.dart';

class GetArtCubit extends BaseCubit<GetArtState> {
  final ArtRepository _apiRepository;
  GetArtCubit(this._apiRepository) : super(const GetArtState());

  Future<void> getListArt({
    required int page,
    required int limit,
  }) async {
    try {
      if (isBusy) return;
      await run(() async {
        await _apiRepository.fetchArts(page: page, limit: limit);
      });
    } catch (e) {
      logger.e(e);
    }
  }
}
