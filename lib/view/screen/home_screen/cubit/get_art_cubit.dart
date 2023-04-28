import 'package:bloc/bloc.dart';
import 'package:flutter_base/core/app/extension/list_extension.dart';

import 'package:flutter_base/core/util/logger/logger.dart';
import 'package:flutter_base/data/model/models.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_art_state.dart';
part 'get_art_cubit.freezed.dart';

class GetArtCubit extends Cubit<GetArtState> {
  GetArtCubit() : super(const GetArtState());

  final ArtRepositoryImpl _artRepositoryImpl = ArtRepositoryImpl();

  Future<void> getListArt() async {
    try {
      if (isClosed) return;
      final List<Art> result =
          await _artRepositoryImpl.getArts(page: 10200, limit: 12);
      emit(state.copyWith(arts: result.clone()));
    } catch (e) {
      logger.e(e);
    }
  }
}
