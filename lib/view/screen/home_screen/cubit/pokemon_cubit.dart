import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/data/model/camera_model/camera.model.dart';
import 'package:flutter_base/data/model/pokemon_model_response/pokemon.model.dart';
import 'package:flutter_base/domain/repository/pokemon_repository.dart';
import 'package:flutter_base/view/cubit/base/cubit_base.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pokemon_state.dart';
part 'pokemon_cubit.freezed.dart';

class PokemonCubit extends BaseCubit<PokemonState> {
  PokemonCubit() : super(const PokemonState());
  final _pokemonRepository = getIt.get<PokemonRepository>();

  Future<void> getPokemon() async {
    try {
      run(() async {
        final data =
            await _pokemonRepository.fetchPokemon(offset: state.offset);
        inspect(data);
        emit(state.copyWith(offset: state.offset + 20));
      });
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> updatePositionCameraSelected(Offset positionChange) async {
    try {
      run(() async {
        if (state.selectedCamera == null) return;
        final listCamera = state.listCamera;
        final index = listCamera.indexOf(state.selectedCamera!);
        if (index != -1) {
          listCamera[index] = state.selectedCamera!
              .copyWith(dx: positionChange.dx, dy: positionChange.dy);
          emit(state.copyWith(listCamera: listCamera));
        }
      });
    } catch (e) {
      inspect(e);
    }
  }
}
