import 'package:flutter/material.dart';
import 'package:flutter_base/core/util/tool/ui_tool.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/get_art_cubit.dart';
import 'package:flutter_base/view/screen/home_screen/widget/image_demo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late ScrollController _scrollController;
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetArtCubit, GetArtState>(
      builder: (context, state) {
        return Scaffold(
          body: ListView.builder(
            controller: _scrollController,
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
