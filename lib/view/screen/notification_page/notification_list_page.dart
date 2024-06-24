import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/config/router/app_routes.route.dart';
import 'package:flutter_base/config/router/router_path.dart';
import 'package:flutter_base/view/screen/notification_page/notification_widget.dart';


@RoutePage()
class NotificationListPage extends StatelessWidget {
  const NotificationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification List'),
        leading: IconButton(
          onPressed: context.router.pop,
          icon: const Icon(Icons.arrow_back_outlined),
        ),
      ),
      body: ListView(
        children: [
          DemoNotificationWidget(onTap: () async {
            await context.router.push(const NotificationDetailARoute());
          }, title: 'To Page A'),
          DemoNotificationWidget(onTap: () async {
            await context.router.pushNamed('/${RouterPath.notificationDetailARoute}/${RouterPath.notificationDetailBRoute}/deepPop=false');
          }, title: 'To Page B'),
          DemoNotificationWidget(onTap: () async {
            await context.router.pushNamed('/${RouterPath.notificationDetailARoute}/${RouterPath.notificationDetailBRoute}/${RouterPath.notificationDetailCRoute}/false');
          }, title: 'To Page C'),

        ]
      ),
    );
  }
}
