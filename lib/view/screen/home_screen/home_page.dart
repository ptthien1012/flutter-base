import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/extensions/scroll_controller_extension.dart';
import 'package:flutter_base/domain/repository/art_repository.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/get_art_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetArtCubit(GetIt.I.get<ArtRepository>())..getListArt(),
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
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.onScrollEndsListener(() {
      context.read<GetArtCubit>().getListArt();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetArtCubit, GetArtState>(
      builder: (context, state) {
        return Scaffold(
            body: SingleChildScrollView(
          child: Column(
            children: [],
          ),
        ));
      },
    );
  }
}
