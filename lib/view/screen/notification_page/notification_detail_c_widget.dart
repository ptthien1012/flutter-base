import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/config/router/app_routes.route.dart';

@RoutePage()
class NotificationDetailCPage extends StatelessWidget {
  const NotificationDetailCPage({super.key, @PathParam('deepPop') this.deepPop = false});
  final bool deepPop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Detail'),
        leading: IconButton(
          onPressed: deepPop ? () => context.router.popUntilRouteWithName(NotificationListRoute.name) : () async => context.router.pop(),
          icon: const Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: const Column(
        children: [
          SizedBox(height: 16),
          Text('Content: Page C'),
          SizedBox(height: 16),
        ],
      )
    );
  }
}
