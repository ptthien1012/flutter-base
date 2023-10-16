import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_base/data/model/camera_model/camera.model.dart';
import 'package:flutter_base/view/screen/home_screen/cubit/pokemon_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                context.read<PokemonCubit>().updateCameraSelected(
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
