import 'package:auto_route/auto_route.dart';
import 'package:flutter_base/config/router/main_router.route.dart';
import 'package:flutter_base/config/router/router_path.dart';
import 'package:flutter_base/view/screen/notification_page/notification_main_layer_wrapper.dart';

final listNotificationRoute = [
  AutoRoute(
      page: NotificationMainLayerWrapperRoute.page,
      path: '/notification',
      children: [
        AutoRoute(page: NotificationListRoute.page, path: '', initial: true),
        AutoRoute(
            page: NotificationFirstLayerWrapperRoute.page,
            path: RouterPath.notificationDetailARoute,
            children: [
              AutoRoute(page: NotificationDetailARoute.page, path: ''),
              AutoRoute(
                  page: NotificationSecondLayerWrapperRoute.page,
                  path: RouterPath.notificationDetailBRoute,
                  children: [
                    AutoRoute(
                        page: NotificationDetailBRoute.page,
                        path: ':deepPop',
                        initial: true),
                    AutoRoute(
                        page: NotificationThirdLayerWrapperRoute.page,
                        path: RouterPath.notificationDetailCRoute,
                        children: [
                          AutoRoute(
                              page: NotificationDetailCRoute.page,
                              path: ':deepPop',
                              initial: true),
                        ]),
                  ]),
            ]),
      ])
];
