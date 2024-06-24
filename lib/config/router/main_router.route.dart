import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/config/router/notification_router.route.dart';
import 'package:flutter_base/view/screen/app_wrapper_page/app_wrapper_page.dart';
import 'package:flutter_base/view/screen/function_page/function_page.dart';
import 'package:flutter_base/view/screen/home_page/home_page.dart';
import 'package:flutter_base/view/screen/main_page/main_page.dart';
import 'package:flutter_base/view/screen/notification_page/notification_detail_a_widget.dart';
import 'package:flutter_base/view/screen/notification_page/notification_detail_b_widget.dart';
import 'package:flutter_base/view/screen/notification_page/notification_detail_c_widget.dart';
import 'package:flutter_base/view/screen/notification_page/notification_first_layer_wrapper.dart';
import 'package:flutter_base/view/screen/notification_page/notification_list_page.dart';
import 'package:flutter_base/view/screen/notification_page/notification_main_layer_wrapper.dart';
import 'package:flutter_base/view/screen/notification_page/notification_second_layer_wrapper.dart';
import 'package:flutter_base/view/screen/notification_page/notification_third_layer_wrapper.dart';
import 'package:flutter_base/view/screen/person_page/person_page.dart';
import 'package:flutter_base/view/screen/search_page/search_page.dart';
import 'package:flutter_base/view/screen/shift_backlog_page/shift_backlog_page.dart';
import 'package:flutter_base/view/screen/supply_page/supply_page.dart';

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
      path: '/',
      page: MainRoute.page,
      initial: true,
      children: [
        AutoRoute(page: HomeRoute.page, path: 'home', initial: true),
        AutoRoute(page: PersonRoute.page, path: 'person'),
        AutoRoute(page: FunctionRoute.page, path: 'function'),
        AutoRoute(page: ShiftBacklogRoute.page, path: 'shiftBacklog'),
        AutoRoute(page: SupplyRoute.page, path: 'supply'),
        AutoRoute(page: SearchRoute.page, path: 'search'),
        ...listNotificationRoute
      ],
    ),
  ];
}
