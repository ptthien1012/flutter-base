import 'package:equatable/equatable.dart';

abstract class BaseState<S> extends Equatable {
  const BaseState();

  S fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson();
}
