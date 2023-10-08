import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/config/theme/app_theme.dart';
import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/core/utils/observer/route_observer.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'config/router/main_router.route.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await dotenv.load(fileName: 'assets/env/.env');
  await Future.wait([
    initializeDependencies(),
    EasyLocalization.ensureInitialized(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
  ]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('vi'),
      ],
      fallbackLocale: const Locale(
        'vi',
      ),
      path: 'assets/locale',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MyAppView();
  }
}

class MyAppView extends StatelessWidget {
  MyAppView({super.key});
  final _appRouter = AppRouter();

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
