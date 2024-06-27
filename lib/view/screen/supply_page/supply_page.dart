import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SupplyPage extends StatelessWidget {
  const SupplyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SupplyPage'),
      ),
      body: const Center(
        child: Text('SupplyPage'),
      ),
    );
  }
}
