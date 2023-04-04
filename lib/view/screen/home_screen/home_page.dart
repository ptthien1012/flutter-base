import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/generated/locale_keys.g.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/get_art_cubit.dart';
import 'package:flutter_base/view/screen/home_screen/view/home_view.dart';
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
