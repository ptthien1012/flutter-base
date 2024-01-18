import 'package:flutter_base/core/base_bloc/base_event.dart';

final class NetworkStatusChanged extends BaseEvent {
  const NetworkStatusChanged({this.isConnected = false});
  final bool isConnected;
}

abstract class SupaBaseEvent extends BaseEvent {}

final class SupaBaseSubscribeEvent extends SupaBaseEvent {
  SupaBaseSubscribeEvent(this.tableName);
  final String tableName;
}

final class SendMessages extends SupaBaseEvent {
  SendMessages(this.message);
  final String message;
}

abstract class CounterEvent extends BaseEvent {}

final class IncrementEvent extends CounterEvent {
  IncrementEvent(this.value);
  final int value;
}

final class DecrementEvent extends CounterEvent {
  DecrementEvent(this.value);
  final int value;
}
