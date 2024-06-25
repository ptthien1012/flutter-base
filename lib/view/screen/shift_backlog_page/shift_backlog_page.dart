import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ShiftBacklogPage extends StatelessWidget {
  const ShiftBacklogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ShiftBacklogPage'),
      ),
      body: const Center(
        child: Text('ShiftBacklogPage'),
      ),
    );
  }
}
