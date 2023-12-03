import 'dart:developer';
import 'dart:math';

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
  Future<void> initCamera() async {
    emit(state.copyWith(listCamera: [
      CameraModel(dx: 0, dy: 0, lens: 20, angle: 0, id: 1, angleWide: 120),
      CameraModel(dx: 50, dy: 50, lens: 20, angle: 0, id: 2, angleWide: 75),
    ]));
  }

  Future<void> getPokemon() async {
    try {
      final data = await _pokemonRepository.fetchPokemon(offset: state.offset);
      inspect(data);
      emit(state.copyWith(offset: state.offset + 20));
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> updateCameraSelected(CameraModel cameraModel) async {
    if (state.selectedCamera == null) {
      emit(state.copyWith(selectedCamera: cameraModel));
      return;
    }
    if (state.selectedCamera == cameraModel) {
      return;
    } else {
      emit(state.copyWith(selectedCamera: cameraModel));
      return;
    }
  }

  Future<void> updatePositionCameraSelected(
      Offset positionChange, CameraModel cameraModel) async {
    try {
      if (state.selectedCamera?.id != cameraModel.id) {
        emit(state.copyWith(selectedCamera: cameraModel));
      }
      final listCamera = state.listCamera.toList();
      final index = listCamera.indexOf(state.selectedCamera!);
      if (index != -1) {
        listCamera[index] = state.selectedCamera!
            .copyWith(dx: positionChange.dx, dy: positionChange.dy);
        emit(state.copyWith(
            listCamera: listCamera, selectedCamera: listCamera[index]));
      }
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> updateAngleCamera(Offset position) async {
    try {
      if (state.selectedCamera == null) return;
      if (state.selectedCamera == null) return;

      List<CameraModel> listCamera = state.listCamera.toList();
      final index = listCamera.indexOf(state.selectedCamera!);
      if (index != -1) {
        double dxCalculate = position.dx - state.flagHelper.dx;
        double dyCalculate = position.dy - state.flagHelper.dy;
        double newAngle = (atan2(dxCalculate, dyCalculate) * 180 / pi) -
            (state.selectedCamera!.angleWide);
        listCamera[index] = state.selectedCamera!.copyWith(angle: -newAngle);
        emit(state.copyWith(
            selectedCamera: listCamera[index], listCamera: listCamera));
      }
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> onTapCameraItem(CameraModel cameraModel) async {
    try {
      if (state.selectedCamera == cameraModel) {
        emit(state.copyWith(selectedCamera: null));
      } else {
        emit(state.copyWith(selectedCamera: cameraModel));
      }
    } catch (e) {
      inspect(e);
    }
  }

  Future<void> selectedCamera(CameraModel cameraModel) async {
    try {
      run(() async {
        if (state.selectedCamera != cameraModel) {
          emit(state.copyWith(selectedCamera: cameraModel));
        }
      });
    } catch (e) {
      inspect(e);
    }
  }

  // Future<void>
}
