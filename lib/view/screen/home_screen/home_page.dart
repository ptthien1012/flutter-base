import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/app/extension/extension.dart';
import 'package:flutter_base/core/app/extension/offset_extension.dart';
import 'package:flutter_base/core/util/tool/ui_tool.dart';
import 'package:flutter_base/data/model/camera_model/camera.model.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/pokemon_cubit.dart';
import 'package:flutter_base/view/screen/home_screen/widget/camera_angle_heatmap.dart';
import 'package:flutter_base/view/screen/home_screen/widget/camera_angle_helper_widget.dart';
import 'package:flutter_base/view/screen/home_screen/widget/camera_item_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return Scaffold(
          backgroundColor: Colors.white,
          body: GestureDetector(
            behavior: HitTestBehavior.deferToChild,
            onPanDown: (details) {
              context
                  .read<PokemonCubit>()
                  .onUpdateFlagHelper(details.localPosition);
            },
            onPanEnd: (details) {
              context.read<PokemonCubit>().onUpdateFlagHelper(Offset.zero);
            },
            onPanUpdate: (details) {
              context
                  .read<PokemonCubit>()
                  .updateAngleCamera(details.localPosition);
            },
            child: Container(
              color: Colors.transparent,
              height: UiTool().getScreenHeight(context: context),
              width: UiTool().getScreenWidth(context: context),
              child: Stack(
                children: [
                  const CameraAngleHelperWidget(),
                  // state.selectedCamera != null
                  //     ? CustomPaint(
                  //         painter: CameraAngleHeatmapPainter(
                  //           angle: state.selectedCamera!.angle,
                  //           startAngle: state.selectedCamera!.angleWide,
                  //           cameraOffset: Offset(state.selectedCamera!.dx,
                  //               state.selectedCamera!.dy),
                  //           radius: 50,
                  //         ),
                  //       )
                  //     : Container(),
                  ...state.listCamera
                      .map((e) => CameraItem(
                            cameraModel: e,
                          ))
                      .toList(),
                  Positioned(
                      top: state.selectedCamera?.dy ?? 0 - 60,
                      left: state.selectedCamera?.dx ?? 0 - 60,
                      child: Container(
                        height: 2,
                        width: 2,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                      ))
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
