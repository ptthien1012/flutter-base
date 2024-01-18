import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/bloc/app_bloc.dart';
import 'package:flutter_base/app/bloc/app_event.dart';

import 'package:flutter_base/app/bloc/app_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppBloc(const AppState())..add(SupaBaseSubscribeEvent('chat')),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: GestureDetector(
              onTap: () {
                context.read<AppBloc>().add(SendMessages('ptthien'));
              },
              child: Container(
                height: 30,
                width: 60,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            ),
          ),
        );
      },
    );
  }
}
