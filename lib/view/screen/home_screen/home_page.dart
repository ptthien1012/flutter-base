import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/util/utils.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/get_art_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetArtCubit()..getListArt(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetArtCubit, GetArtState>(
      builder: (context, state) {
        return Scaffold(
          body: Column(
            children: [
              Text('Regular'),
            ],
          ),
        );
      },
    );
  }
}
