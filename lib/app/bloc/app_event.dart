import 'package:equatable/equatable.dart';

sealed class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

final class NetworkStatusChanged extends AppEvent {
  final bool isConnected;

  const NetworkStatusChanged(this.isConnected);

  @override
  List<Object> get props => [isConnected];
}
