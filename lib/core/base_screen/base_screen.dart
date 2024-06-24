import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: context.screenHeight,
        width: context.screenWidth,
        color: Colors.white,
        child: SafeArea(child: Container()));
  }
}
