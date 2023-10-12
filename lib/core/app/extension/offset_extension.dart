import 'dart:ui';

extension OffsetExtension<T> on Offset {
  bool get isZero => this == Offset.zero;
}
