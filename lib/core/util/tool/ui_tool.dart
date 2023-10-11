import 'package:flutter/material.dart';

class UiTool {
  double getScreenWidth({required BuildContext context}) {
    return MediaQuery.sizeOf(context).width;
  }

  double getScreenHeight({required BuildContext context}) {
    return MediaQuery.sizeOf(context).height;
  }
}
