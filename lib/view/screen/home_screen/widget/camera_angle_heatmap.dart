import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_base/core/app/extension/extension.dart';

class CameraAngleHeatmapPainter extends CustomPainter {
  final double angle;
  final double startAngle;
  final Offset cameraOffset;
  final double radius;
  const CameraAngleHeatmapPainter({
    required this.angle,
    required this.startAngle,
    required this.cameraOffset,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final centerX = size.width / 2;
    final centerY = size.height / 2;

    final cameraPaint = Paint()
      ..color = Colors.red
      ..style = PaintingStyle.fill
      ..strokeWidth = 2.0;

    // Calculate the FOV endpoints
    // final fovLength = 150.0; // Adjust the FOV length

    final startRadians = startAngle * (pi / 180);
    final endRadians = (startAngle * (pi / 180)) + (angle * (pi / 180));

    final start = cameraOffset.getOffsetFromAngle(startAngle, radius);
    final startX = start.dx * cos(startRadians);
    final startY = start.dy * sin(startRadians);
    final end = cameraOffset.getOffsetFromAngle(angle, radius);
    final endX = end.dx * cos(startRadians);
    final endY = end.dy * sin(startRadians);
    final path = Path()
      ..moveTo(cameraOffset.dx + 35, cameraOffset.dy + 35)
      ..lineTo(startX, startY)
      ..lineTo(end.dx, end.dy)
      ..close();

    // Draw the FOV area
    canvas.drawPath(path, cameraPaint);

    final cameraCenter = Offset(centerX, centerY);

    // Draw the camera position
    final cameraRadius = 5.0;
    final cameraCirclePaint = Paint()..color = Colors.red;
    canvas.drawCircle(cameraCenter, cameraRadius, cameraCirclePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
