import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/app/bloc/app_bloc.dart';
import 'package:flutter_base/app/bloc/app_event.dart';

import 'package:flutter_base/app/bloc/app_state.dart';
import 'package:flutter_base/config/router/app_routes.route.dart';
import 'package:flutter_base/view/screen/home_page/widget/appbar_home_widget.dart';
import 'package:flutter_base/view/shared/calendar/app_calendar.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rive/rive.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppBloc(const AppState()),
      child: const HomePageView(),
    );
  }
}

class HomePageView extends StatefulWidget {
  const HomePageView({super.key});

  @override
  State<HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Container(
          color: Colors.white,
          height: context.screenHeight,
          width: context.screenWidth,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: '#F5F5F5'.toColor,
              body: Column(
                children: [
                  const AppBarHomeWidget(),
                  Expanded(
                    child: Container(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
