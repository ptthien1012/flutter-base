// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'main_router.route.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    AppWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const AppWrapperPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    NotificationDetailARoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationDetailAPage(),
      );
    },
    NotificationDetailBRoute.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<NotificationDetailBRouteArgs>(
          orElse: () => NotificationDetailBRouteArgs(
                  deepPop: queryParams.optBool(
                'deepPop',
                false,
              )));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationDetailBPage(
          key: args.key,
          deepPop: args.deepPop,
        ),
      );
    },
    NotificationDetailCRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<NotificationDetailCRouteArgs>(
          orElse: () => NotificationDetailCRouteArgs(
                  deepPop: pathParams.getBool(
                'deepPop',
                false,
              )));
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationDetailCPage(
          key: args.key,
          deepPop: args.deepPop,
        ),
      );
    },
    NotificationFirstLayerWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationFirstLayerWrapperPage(),
      );
    },
    NotificationListRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationListPage(),
      );
    },
    NotificationSecondLayerWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationSecondLayerWrapperPage(),
      );
    },
    NotificationThirdLayerWrapperRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const NotificationThirdLayerWrapperPage(),
      );
    },
  };
}

/// generated route for
/// [AppWrapperPage]
class AppWrapperRoute extends PageRouteInfo<void> {
  const AppWrapperRoute({List<PageRouteInfo>? children})
      : super(
          AppWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'AppWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationDetailAPage]
class NotificationDetailARoute extends PageRouteInfo<void> {
  const NotificationDetailARoute({List<PageRouteInfo>? children})
      : super(
          NotificationDetailARoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationDetailARoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationDetailBPage]
class NotificationDetailBRoute
    extends PageRouteInfo<NotificationDetailBRouteArgs> {
  NotificationDetailBRoute({
    Key? key,
    bool? deepPop = false,
    List<PageRouteInfo>? children,
  }) : super(
          NotificationDetailBRoute.name,
          args: NotificationDetailBRouteArgs(
            key: key,
            deepPop: deepPop,
          ),
          rawQueryParams: {'deepPop': deepPop},
          initialChildren: children,
        );

  static const String name = 'NotificationDetailBRoute';

  static const PageInfo<NotificationDetailBRouteArgs> page =
      PageInfo<NotificationDetailBRouteArgs>(name);
}

class NotificationDetailBRouteArgs {
  const NotificationDetailBRouteArgs({
    this.key,
    this.deepPop = false,
  });

  final Key? key;

  final bool? deepPop;

  @override
  String toString() {
    return 'NotificationDetailBRouteArgs{key: $key, deepPop: $deepPop}';
  }
}

/// generated route for
/// [NotificationDetailCPage]
class NotificationDetailCRoute
    extends PageRouteInfo<NotificationDetailCRouteArgs> {
  NotificationDetailCRoute({
    Key? key,
    bool deepPop = false,
    List<PageRouteInfo>? children,
  }) : super(
          NotificationDetailCRoute.name,
          args: NotificationDetailCRouteArgs(
            key: key,
            deepPop: deepPop,
          ),
          rawPathParams: {'deepPop': deepPop},
          initialChildren: children,
        );

  static const String name = 'NotificationDetailCRoute';

  static const PageInfo<NotificationDetailCRouteArgs> page =
      PageInfo<NotificationDetailCRouteArgs>(name);
}

class NotificationDetailCRouteArgs {
  const NotificationDetailCRouteArgs({
    this.key,
    this.deepPop = false,
  });

  final Key? key;

  final bool deepPop;

  @override
  String toString() {
    return 'NotificationDetailCRouteArgs{key: $key, deepPop: $deepPop}';
  }
}

/// generated route for
/// [NotificationFirstLayerWrapperPage]
class NotificationFirstLayerWrapperRoute extends PageRouteInfo<void> {
  const NotificationFirstLayerWrapperRoute({List<PageRouteInfo>? children})
      : super(
          NotificationFirstLayerWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationFirstLayerWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationListPage]
class NotificationListRoute extends PageRouteInfo<void> {
  const NotificationListRoute({List<PageRouteInfo>? children})
      : super(
          NotificationListRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationListRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationSecondLayerWrapperPage]
class NotificationSecondLayerWrapperRoute extends PageRouteInfo<void> {
  const NotificationSecondLayerWrapperRoute({List<PageRouteInfo>? children})
      : super(
          NotificationSecondLayerWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationSecondLayerWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [NotificationThirdLayerWrapperPage]
class NotificationThirdLayerWrapperRoute extends PageRouteInfo<void> {
  const NotificationThirdLayerWrapperRoute({List<PageRouteInfo>? children})
      : super(
          NotificationThirdLayerWrapperRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationThirdLayerWrapperRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
