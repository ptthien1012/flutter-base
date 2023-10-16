import 'dart:math';
import 'dart:ui';

extension OffsetExtension<T> on Offset {
  bool get isZero => this == Offset.zero;

  Offset getOffsetFromAngle(double angle, double radius) {
    //   final angleInRadians = angleInDegrees * (pi / 180.0);
    // final deltaX = distance * cos(angleInRadians);
    // final deltaY = distance * sin(angleInRadians);

    // final newOffset = Offset(baseOffset.dx + deltaX, baseOffset.dy + deltaY);
    double angleInRadians = angle * (pi / 180);
    // double xOffset = cos(angleInRadians);

    // double yOffset = sin(angleInRadians);
    final newOffset = Offset(dx, dy);
    return newOffset;
  }
}
