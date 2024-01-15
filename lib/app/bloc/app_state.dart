import 'package:flutter_base/core/base_bloc/base_state.dart';

class AppState extends BaseState<AppState> {
  const AppState(this.counter);
  final int counter;
  @override
  List<Object?> get props => [counter];

  @override
  AppState fromJson(Map<String, dynamic> json) {
    return AppState(json['counter'] as int);
  }

  @override
  Map<String, dynamic> toJson() {
    return {'counter': counter};
  }
}
