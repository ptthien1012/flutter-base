import 'package:flutter_base/core/base_bloc/base_state.dart';

class AppState extends BaseState<AppState> {
  const AppState();

  @override
  List<Object?> get props => [];

  @override
  AppState fromJson(Map<String, dynamic> json) {
    return AppState();
  }

  @override
  Map<String, dynamic> toJson() {
    return {};
  }
}
