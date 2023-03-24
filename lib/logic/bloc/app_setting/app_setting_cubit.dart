import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'app_setting_state.dart';
part 'app_setting_cubit.freezed.dart';

class AppSettingCubit extends Cubit<AppSettingState> {
  AppSettingCubit()
      : super(
          const AppSettingState(
            themeMode: ThemeMode.system,
          ),
        );
}
