import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/util/tool/ui_tool.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/pokemon_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PokemonCubit(), child: const HomeView());
  }
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double angle = 0;
  Offset positionItem = Offset.zero;
  Offset panDown = Offset.zero;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        onPanDown: (details) {
          // double distance = sqrt(pow(details.localPosition.dx - panDown.dx, 2) +
          //     pow(details.localPosition.dy - panDown.dy, 2));
          // bool isInside = distance <= 20;
          // if (isInside) {

          // }
          setState(() {
            panDown = details.localPosition;
          });
        },
        onPanEnd: (details) {
          setState(() {
            panDown = Offset.zero;
          });
        },
        onPanUpdate: (details) {
          double dxCalculate = details.localPosition.dx - panDown.dx;
          double dyCalculate = details.localPosition.dy - panDown.dy;

          // Calculate the new angle based on the drag position
          double newAngle = atan2(dxCalculate, dyCalculate) * 180 / pi - 30;

          setState(() {
            angle = -newAngle;
          });
        },
        child: Container(
          color: Colors.transparent,
          height: UiTool().getScreenHeight(context: context),
          width: UiTool().getScreenWidth(context: context),
          child: Stack(
            children: [
              Positioned(
                  left: panDown.dx,
                  top: panDown.dy,
                  child: AnimatedSwitcher(
                    reverseDuration: const Duration(milliseconds: 300),
                    duration: const Duration(milliseconds: 300),
                    child: (panDown.dx == 0 && panDown.dy == 0)
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
              CameraItem(angle: angle)
            ],
          ),
        ),
      ),
    );
  }
}

class CameraItem extends StatefulWidget {
  final double angle;
  const CameraItem({super.key, required this.angle});

  @override
  State<CameraItem> createState() => _CameraItemState();
}

class _CameraItemState extends State<CameraItem> {
  Offset positionItem = Offset.zero;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: positionItem.dx,
      top: positionItem.dy,
      child: GestureDetector(
        onVerticalDragUpdate: (details) {
          setState(() {
            positionItem = Offset(
                details.globalPosition.dx - 40, details.globalPosition.dy - 40);
          });
        },
        child: CustomPaint(
          painter: CircleWithAnglePainter(angle: 75, startAngle: widget.angle),
          size: const Size(40, 40),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent.shade100, width: 6),
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
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
