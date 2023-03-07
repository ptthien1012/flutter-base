import 'dart:developer';

import 'package:hydrated_bloc/hydrated_bloc.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log('onCreate -- Bloc: ${bloc.runtimeType}');
    super.onCreate(bloc);
  }

  @override
  void onClose(BlocBase bloc) {
    log('onClose -- Bloc: ${bloc.runtimeType}');
    super.onClose(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log('onChange -- Bloc: ${bloc.runtimeType},\nChange: ${change.runtimeType}');
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError -- Error: $error\n Bloc: ${bloc.runtimeType}');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('onEvent -- Bloc: ${bloc.runtimeType}\n Event: $event\n Bloc: ${bloc.runtimeType}');
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('onTransition -- Bloc: ${bloc.runtimeType}\n Transition: ${bloc.runtimeType}');
    super.onTransition(bloc, transition);
  }
}
