import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_base/data/data_source/remote/queries/list_country_query.model.dart';
import 'package:flutter_base/domain/repository/weather_repository.dart';
import 'package:flutter_base/view/screen/home_screen/features/weather/presentation/cubit/weather_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(),
      child: const HomeView(),
    );
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
    return BlocBuilder<WeatherCubit, WeatherState>(
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
                    await context
                        .read<WeatherCubit>()
                        .fetchSearchAutocomplete();
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
