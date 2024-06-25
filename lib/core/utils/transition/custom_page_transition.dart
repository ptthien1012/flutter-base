import 'package:flutter/material.dart';

class CustomPageTransition extends PageRouteBuilder {
  CustomPageTransition({required this.page, required this.transitionsBuilder})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: transitionsBuilder,
        );
  final Widget page;
  final Widget Function(
          BuildContext, Animation<double>, Animation<double>, Widget)
      transitionsBuilder;
}
