import 'package:flutter/material.dart';
import 'package:flutter_base/core/util/tool/ui_tool.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/get_art_cubit.dart';
import 'package:flutter_base/view/screen/home_screen/widget/image_demo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetArtCubit, GetArtState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView.builder(
            itemCount: state.arts.length,
            itemBuilder: (context, index) {
              return ImageDemo(url: state.arts[index].url!);
            },
          ),
        );
      },
    );
  }
}
