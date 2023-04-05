import 'package:bloc/bloc.dart';
import 'package:flutter_base/data/model/art.model.dart';
import 'package:flutter_base/data/repository/art_repository/art_repository.impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get_it/get_it.dart';

part 'get_art_state.dart';
part 'get_art_cubit.freezed.dart';

class GetArtCubit extends Cubit<GetArtState> {
  GetArtCubit() : super(const GetArtState());

  final ArtRepositoryImpl _artRepositoryImpl = GetIt.I.get<ArtRepositoryImpl>();

  Future<void> getListArt() async {
    final List<Art> result =
        await _artRepositoryImpl.getArts(page: 10200, limit: 12);
    emit(state.copyWith(arts: result));
  }
}
