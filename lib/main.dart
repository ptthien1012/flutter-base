import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/config/theme/app_theme.dart';
import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'config/router/main_router.route.dart';
import 'core/utils/observer/route_observer.dart';

final _appRouter = AppRouter();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: 'assets/env/develop.env');
  await Future.wait([
    initializeDependencies(),
    EasyLocalization.ensureInitialized(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack),
  ]);
  // SETUP SUPABASE
  await Supabase.initialize(
    url: dotenv.get('SUPABASE_URL'),
    anonKey: dotenv.get('SUPABASE_KEY'),
    authOptions: const FlutterAuthClientOptions(
      authFlowType: AuthFlowType.pkce,
    ),
    realtimeClientOptions: const RealtimeClientOptions(
      logLevel: RealtimeLogLevel.info,
    ),
    storageOptions: const StorageClientOptions(
      retryAttempts: 10,
    ),
  );
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

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
