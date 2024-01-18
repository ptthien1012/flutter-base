import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_base/app/bloc/app_event.dart';
import 'package:flutter_base/app/bloc/app_state.dart';
import 'package:flutter_base/core/base_bloc/base_bloc.dart';
import 'package:flutter_base/core/core.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

class AppBloc extends BaseBloc<SupaBaseEvent, AppState> {
  AppBloc(super.state) {
    on<SupaBaseSubscribeEvent>(
      (event, emit) {},
      transformer: sequential(),
    );
    on<SendMessages>(
      (event, emit) {
        try {
          final supabase = Supabase.instance.client;
          supabase.from('chat').insert({
            'text': event.message,
          }).then((value) => print(value));
        } catch (e) {
          logger.e(e);
        }
      },
    );
  }
  @override
  Future<void> close() {
    supabase.unsubscribe();
    return super.close();
  }

  final supabase = Supabase.instance.client
      .channel('public:chat')
      .onPostgresChanges(
          event: PostgresChangeEvent.all,
          schema: 'public',
          table: 'chat',
          callback: (payload) {
            logger.i(payload);
          })
      .subscribe();
}
