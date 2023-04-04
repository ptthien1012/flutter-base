import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/core/util/observer/route_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/injection/injection.dart';
import 'app/router/app_routes.route.dart';
import 'generated/assets.gen.dart';
import 'logic/bloc/app_setting/app_setting_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Future.wait([
    EasyLocalization.ensureInitialized(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]),
    dotenv.load(fileName: Assets.env.env),
    configureDependencies(),
  ]);

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppSettingCubit(),
        )
      ],
      child: MyAppView(),
    );
  }
}

class MyAppView extends StatelessWidget {
  MyAppView({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppSettingCubit, AppSettingState>(
      builder: (context, state) {
        return MaterialApp.router(
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          debugShowCheckedModeBanner: false,
          routerConfig: _appRouter.config(
            navigatorObservers: () => [AppRouteObserver()],
          ),
        );
      },
    );
  }
}
