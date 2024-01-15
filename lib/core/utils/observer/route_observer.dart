import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/core/utils/logger/logger.dart';

class AppRouteObserver extends AutoRouteObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    logger.i('Did push route: ${route.settings.name}');
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    logger.i('Did pop route: ${route.settings.name}');
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    logger.i('Did remove route: ${route.settings.name}');
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    logger.i('Did replace route: ${newRoute?.settings.name}');
  }

  @override
  void didInitTabRoute(TabPageRoute route, TabPageRoute? previousRoute) {
    logger.i(
        'Current tab route: ${route.name}\nPrevious tab route: ${previousRoute?.name}');
  }
}
