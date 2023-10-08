import 'package:flutter/material.dart';

extension AppColor on String {
  /// input: `#XXXXXXXXXXXXXXX`
  ///
  /// output: `Color(0X000000)`
  ///
  /// Prefer an 8-digit hexadecimal integer(0xFFFFFFFF) to instantiate Color.
  Color get toColor => Color(int.parse('0XFF${substring(1)}'));
}
