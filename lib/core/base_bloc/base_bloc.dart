import 'package:flutter_base/core/base_bloc/base_event.dart';
import 'package:flutter_base/core/base_bloc/base_state.dart';
import 'package:flutter_base/core/core.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:replay_bloc/replay_bloc.dart';

abstract class BaseBloc<E extends BaseEvent, S extends BaseState>
    extends HydratedBloc<E, S> with ReplayBlocMixin {
  BaseBloc(super.state);

  @override
  S? fromJson(Map<String, dynamic> json) {
    return this.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(S state) {
    return this.toJson(state);
  }

  @override
  void onTransition(Transition<E, S> transition) {
    super.onTransition(transition);
    Log.instance.t(transition);
  }

  @override
  void onEvent(E event) {
    Log.instance.t(event);
    super.onEvent(event);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    Log.instance.e(error);
  }
}
