import 'package:flutter/material.dart';
import 'package:flutter_base/core/util/tool/ui_tool.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/get_art_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        GestureDetector(
          onTap: () {
            context.read<GetArtCubit>().getListArt();
          },
          child: Container(
            height: UiTool().getScreenWidth(context: context),
            width: UiTool().getScreenWidth(context: context),
            color: Colors.red,
          ),
        )
      ]),
    );
  }
}
