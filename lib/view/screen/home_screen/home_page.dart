import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/pokemon_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PokemonCubit()..initCamera(),
        child: const HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          height: context.screenSize.height,
          width: context.screenSize.width,
          child: SafeArea(
            child: Scaffold(
                body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () async {
                    final notificationController =
                        await getIt.getAsync<FlutterLocalNotificationsPlugin>();
                    notificationController.show(0, 'ptthien', 'demo', null);
                  },
                  child: Container(
                    height: 50,
                    width: 60,
                    color: Colors.amber,
                  ),
                )
              ],
            )),
          ),
        );
      },
    );
  }
}
