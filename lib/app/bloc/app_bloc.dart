import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_base/app/bloc/app_event.dart';
import 'package:flutter_base/app/bloc/app_state.dart';
import 'package:flutter_base/core/base_bloc/base_bloc.dart';

class AppBloc extends BaseBloc<SupaBaseEvent, AppState> {
  AppBloc(super.state) {
    on<SupaBaseSubscribeEvent>(
      (event, emit) {},
      transformer: sequential(),
    );
    on<SendMessages>(
      (event, emit) async {},
    );
  }
}
