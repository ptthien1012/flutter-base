import 'dart:math';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/app/extension/offset_extension.dart';
import 'package:flutter_base/core/util/tool/ui_tool.dart';
import 'package:flutter_base/data/model/camera_model/camera.model.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/pokemon_cubit.dart';
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
                  Positioned(
                      left: state.flagHelper.dx,
                      top: state.flagHelper.dy,
                      child: AnimatedSwitcher(
                        reverseDuration: const Duration(milliseconds: 300),
                        duration: const Duration(milliseconds: 300),
                        child: (state.flagHelper.isZero)
                            ? const SizedBox()
                            : Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.grey.withOpacity(0.3),
                                  shape: BoxShape.circle,
                                ),
                              ),
                      )),
                  ...state.listCamera
                      .map((e) => CameraItem(
                            cameraModel: e,
                          ))
                      .toList()
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class CameraItem extends StatefulWidget {
  final CameraModel cameraModel;

  const CameraItem({
    super.key,
    required this.cameraModel,
  });

  @override
  State<CameraItem> createState() => _CameraItemState();
}

class _CameraItemState extends State<CameraItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
      builder: (context, state) {
        return Positioned(
          left: widget.cameraModel.dx,
          top: widget.cameraModel.dy,
          child: GestureDetector(
            onPanDown: (details) =>
                context.read<PokemonCubit>().updatePositionCameraSelected(
                      Offset(details.globalPosition.dx - 35,
                          details.globalPosition.dy - 35),
                      widget.cameraModel,
                    ),
            onPanUpdate: (details) {
              context.read<PokemonCubit>().updatePositionCameraSelected(
                    Offset(details.globalPosition.dx - 35,
                        details.globalPosition.dy - 35),
                    widget.cameraModel,
                  );
            },
            child: CustomPaint(
              painter: CircleWithAnglePainter(
                  angle: widget.cameraModel.angleWide,
                  startAngle: widget.cameraModel.angle),
              size: const Size(35, 35),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: state.selectedCamera == widget.cameraModel
                            ? Colors.blueAccent.shade100
                            : Colors.grey.shade300,
                        width: 6),
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CircleWithAnglePainter extends CustomPainter {
  final double angle; // Angle in degrees
  final double startAngle;

  CircleWithAnglePainter({
    required this.angle,
    required this.startAngle,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;

    double radius = size.width / 2;
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double sweepAngle = (angle * pi / 180);
    double sweepAngleCalculate = (startAngle * pi / 180);
    // Draw the circular arc
    canvas.drawArc(
      Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
      sweepAngleCalculate,
      sweepAngle,
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
