import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/config/router/app_routes.route.dart';

@RoutePage()
class NotificationDetailBPage extends StatelessWidget {
  const NotificationDetailBPage({super.key, @QueryParam('deepPop') this.deepPop = false});
  final bool? deepPop;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Detail'),
        leading: IconButton(
          onPressed: (deepPop ?? false) ? () => context.router.popUntilRouteWithName(NotificationListRoute.name) : () async => context.router.pop(),
          icon: const Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 16),
          const Text('Content: Page B'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              await context.router.push(NotificationDetailCRoute());
            },
            child: const Text('Go to Page C'),
          ),
        ],
      )
    );
  }
}
