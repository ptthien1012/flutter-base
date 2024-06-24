import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/config/router/router_path.dart';
import 'package:flutter_base/view/screen/app_wrapper_page/app_wrapper_page.dart';
import 'package:flutter_base/view/screen/home_page/home_page.dart';
import 'package:flutter_base/view/screen/notification_page/notification_detail_a_widget.dart';
import 'package:flutter_base/view/screen/notification_page/notification_detail_b_widget.dart';
import 'package:flutter_base/view/screen/notification_page/notification_detail_c_widget.dart';
import 'package:flutter_base/view/screen/notification_page/notification_first_layer_wrapper.dart';
import 'package:flutter_base/view/screen/notification_page/notification_second_layer_wrapper.dart';
import 'package:flutter_base/view/screen/notification_page/notification_third_layer_wrapper.dart';
import 'package:flutter_base/view/screen/notification_page/notification_list_page.dart';

part 'main_router.route.gr.dart';

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends _$AppRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: AppWrapperRoute.page,
      path: '/',
      children: [
        // AutoRoute(page: HomeRoute.page, path: ''),
        AutoRoute(page: NotificationListRoute.page, path: ''),
        AutoRoute(page: NotificationFirstLayerWrapperRoute.page, path: RouterPath.notificationDetailARoute,
        children: [
          AutoRoute(page: NotificationDetailARoute.page, path: ''),
          AutoRoute(page: NotificationSecondLayerWrapperRoute.page, path: RouterPath.notificationDetailBRoute,
          children: [
            AutoRoute(page: NotificationDetailBRoute.page, path: ':deepPop', initial: true),
            AutoRoute(page: NotificationThirdLayerWrapperRoute.page, path: RouterPath.notificationDetailCRoute,
            children: [
              AutoRoute(page: NotificationDetailCRoute.page, path: ':deepPop', initial: true),
          ]),
        ]),
      ]),
    ]),
  ];
}
