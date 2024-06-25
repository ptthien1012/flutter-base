import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/config/router/app_routes.route.dart';

@RoutePage()
class NotificationDetailAPage extends StatelessWidget {
  const NotificationDetailAPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notification Detail'),
          leading: IconButton(
            onPressed: () async => context.router.maybePop(),
            icon: const Icon(Icons.arrow_back_outlined),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(height: 16),
            const Text('Content: Page A'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                await context.router.push(NotificationDetailBRoute());
              },
              child: const Text('Go to Page B'),
            ),
          ],
        ));
  }
}
