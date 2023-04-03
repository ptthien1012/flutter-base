import 'package:flutter/material.dart';

class UiTool {
  double getScreenWidth({required BuildContext context}) {
    return MediaQuery.of(context).size.width;
  }

  double getScreenHeight({required BuildContext context}) {
    return MediaQuery.of(context).size.height;
  }
}
