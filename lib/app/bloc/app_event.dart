import 'package:flutter_base/core/base_bloc/base_event.dart';

final class NetworkStatusChanged extends BaseEvent {
  const NetworkStatusChanged({this.isConnected = false});
  final bool isConnected;

  @override
  List<Object> get props => [isConnected];
}

abstract class CounterEvent extends BaseEvent {}

final class IncrementEvent extends CounterEvent {
  IncrementEvent(this.value);
  final int value;

  @override
  List<Object?> get props => [value];
}

final class DecrementEvent extends CounterEvent {
  DecrementEvent(this.value);
  final int value;

  @override
  List<Object?> get props => [value];
}
