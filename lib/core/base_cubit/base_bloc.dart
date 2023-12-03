import 'dart:async';

import 'base_state.dart';

abstract class BaseBloc<State extends BaseState> {
  final _stateStreamController = StreamController<BaseState>.broadcast();

  void dispose() {
    _stateStreamController.close();
  }

  void emitState(BaseState state) {
    _stateStreamController.sink.add(state);
  }
}
