import 'package:dio/dio.dart';
import 'package:flutter_base/core/utils/data/data_state.dart';
import 'package:flutter_base/data/model/models.dart';
import 'package:flutter_base/domain/repository/art_repository.dart';
import 'package:flutter_base/view/cubit/base/cubit_base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_art_state.dart';
part 'get_art_cubit.freezed.dart';

class GetArtCubit extends BaseCubit<GetArtState> {
  final ArtRepository _apiRepository;
  GetArtCubit(this._apiRepository) : super(const GetArtState());

  Future<void> getListArt() async {
    if (isBusy) return;
    run(() async {
      final response =
          await _apiRepository.fetchArts(page: state.page, limit: state.limit);
      if (response is DataSuccess) {
        final List<Art> listArtResponse = response.data?.artworks ?? [];
        final listArt = List<Art>.from(state.arts)..addAll(listArtResponse);
        emit(state.copyWith(arts: listArt, page: state.page + 1));
      } else if (response is DataFailed) {
        emit(state.copyWith(error: response.error));
      }
    });
  }
}
