import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  ThemeData get theme => Theme.of(this);

  Brightness get brightness => MediaQuery.of(this).platformBrightness;
}
