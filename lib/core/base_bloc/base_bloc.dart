import 'package:bloc/bloc.dart';
import 'package:flutter_base/core/base_bloc/base_event.dart';
import 'package:flutter_base/core/base_bloc/base_state.dart';
import 'package:flutter_base/core/core.dart';

abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends Bloc<E, S> {
  BaseBloc(super.initialState);

  @override
  void onTransition(Transition<E, S> transition) {
    super.onTransition(transition);
    Log.instance.i(transition);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    Log.instance.e(error);
  }
}
