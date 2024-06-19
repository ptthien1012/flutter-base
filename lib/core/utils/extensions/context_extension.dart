import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  Size get screenSize => MediaQuery.sizeOf(this);

  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;

  ThemeData get theme => Theme.of(this);

  Brightness get brightness => MediaQuery.of(this).platformBrightness;
}
