import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/config/theme/app_theme.dart';
import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'config/router/main_router.route.dart';
import 'core/utils/observer/route_observer.dart';

final _appRouter = AppRouter();
Future<void> main() async {
  await Hive.initFlutter();
  await Future.wait([
    initializeDependencies(),
    EasyLocalization.ensureInitialized(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack),
  ]);
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('vi')],
      fallbackLocale: const Locale('en'),
      path: 'assets/locale',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: AppTheme.light,
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(
        navigatorObservers: () => [
          AppRouteObserver(),
        ],
      ),
    );
  }
}
