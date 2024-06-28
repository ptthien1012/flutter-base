import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/config/router/app_routes.route.dart';
import 'package:flutter_base/config/router/router_path.dart';
import 'package:flutter_base/core/utils/extensions/string_extension.dart';
import 'package:flutter_base/view/screen/notification_page/widget/notification_widget.dart';
import 'package:flutter_base/view/screen/schedule_list_page/widget/schedule_list_item.dart';

@RoutePage()
class NotificationListPage extends StatelessWidget {
  const NotificationListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông báo'),
        centerTitle: true,
        leading: IconButton(
          onPressed: context.router.pop,
          icon: const Icon(Icons.arrow_back_outlined),
        ),
      ),
      backgroundColor: '#F5F5F5'.toColor,
      body: RefreshIndicator(
        color: Colors.grey.shade600,
        backgroundColor: Colors.white,
        onRefresh: () async {
          // ignore: inference_failure_on_instance_creation
          await Future.delayed(const Duration(seconds: 2));
        },
        child: Column(
          children: [
            const SizedBox(height: 8),
            const DefaultTabController(
              initialIndex: 1,
              length: 3,
              child: TabBar(
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                indicatorColor: Colors.black,
                tabs: [
                  Tab(text: 'Tất cả'),
                  Tab(text: 'Công việc'),
                  Tab(text: 'Truyền thông'),
                ],
              ),
            ),
            const SizedBox(height: 8),
            permissionAlert(context),
            const SizedBox(height: 8),
            ListView(shrinkWrap: true, children: [
              DemoNotificationWidget(
                  onTap: () async {
                    await context.router.push(const NotificationDetailARoute());
                  },
                  title: 'PT Map Version 2.0 tích hợp trên App MyPT Version 2.0 hỗ trợ nhân viên kỹ thuật page 1'),
              const SizedBox(height: 8),
              DemoNotificationWidget(
                  onTap: () async {
                    await context.router.pushNamed(
                        '/notification/${RouterPath.notificationDetailARoute}/${RouterPath.notificationDetailBRoute}/deepPop=false');
                  },
                  title: 'PT Map Version 2.0 tích hợp trên App MyPT Version 2.0 hỗ trợ nhân viên kỹ thuật page 2'),
              const SizedBox(height: 8),
              DemoNotificationWidget(
                  onTap: () async {
                    await context.router.pushNamed(
                        '/notification/${RouterPath.notificationDetailARoute}/${RouterPath.notificationDetailBRoute}/${RouterPath.notificationDetailCRoute}/false');
                  },
                  title: 'PT Map Version 2.0 tích hợp trên App MyPT Version 2.0 hỗ trợ nhân viên kỹ thuật page 3'),
            ]),
          ],
        ),
      ),
    );
  }

  Widget permissionAlert(BuildContext context) {
    return Stack(children: [
      Positioned(
        right: 8,
        top: 8,
        child: DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.close_outlined,
              color: Colors.grey,
              size: 16,
            )),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 8),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(32)),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(Icons.notifications)),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Bật thông báo để không bỏ lỡ tin quan trọng như nhân công việc, nhắc hạn gạch nợ',
                    maxLines: 2,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Spacer(),
                Text(
                  'Mở cài đặt',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                )
              ],
            ),
          ],
        ),
      )
    ]);
  }
}
