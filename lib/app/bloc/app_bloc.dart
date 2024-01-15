import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_base/app/bloc/app_event.dart';
import 'package:flutter_base/app/bloc/app_state.dart';
import 'package:flutter_base/core/base_bloc/base_bloc.dart';

class AppBloc extends BaseBloc<CounterEvent, AppState> {
  AppBloc(super.state) {
    on<IncrementEvent>((event, emit) {
      emit(AppState(state.counter + event.value));
    });
    on<DecrementEvent>(
      (event, emit) {
        redo();
      },
      transformer: droppable(),
    );
  }
}
