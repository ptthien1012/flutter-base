import 'package:flutter_base/core/base_bloc/base_state.dart';

class AppState extends BaseState {
  AppState(this.counter);
  int counter = 0;
  @override
  List<Object?> get props => [counter];
}
