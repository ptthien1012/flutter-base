import 'package:auto_route/auto_route.dart';
import 'package:flutter_base/view/screen/app_wrapper_page/app_wrapper_page.dart';
import 'package:flutter_base/view/screen/home_page/home_page.dart';

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
        AutoRoute(page: HomeRoute.page, path: ''),
      ],
    ),
  ];
}
