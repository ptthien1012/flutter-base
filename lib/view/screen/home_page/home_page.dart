import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/app/bloc/app_bloc.dart';
import 'package:flutter_base/app/bloc/app_event.dart';

import 'package:flutter_base/app/bloc/app_state.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          AppBloc(const AppState())..add(SupaBaseSubscribeEvent('chat')),
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
  CalendarController calendarController = CalendarController();
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
                body: Column(
              children: [
                Container(
                  height: 60,
                  width: context.screenWidth,
                  child: ListView.separated(
                      physics: const ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 60,
                          width: context.screenWidth * 0.15,
                          color: Colors.blue,
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Container(
                          width: 1,
                          height: 60,
                          color: Colors.grey.shade300,
                        );
                      },
                      itemCount: 10),
                ),
                Expanded(
                  child: SfCalendar(
                    view: CalendarView.day,
                    timeSlotViewSettings: const TimeSlotViewSettings(
                        timeInterval: Duration(hours: 1)),
                    headerHeight: 0,
                    viewHeaderHeight: 0,
                    controller: calendarController,
                    // showNavigationArrow: model.isWebFullView,
                    // controller: calendarController,
                    // showDatePickerButton: true,
                    // allowedViews: _allowedViews,
                    // specialRegions: regions,
                    // timeRegionBuilder: _getSpecialRegionWidget,
                    // timeSlotViewSettings: const TimeSlotViewSettings(
                    //     minimumAppointmentDuration: Duration(minutes: 30)),
                    // dataSource: dataSource,
                  ),
                ),
              ],
            )),
          ),
        );
      },
    );
  }

  Future<RiveFile?> getRiverFile() async {
    final file = await RiveFile.asset('assets/riv/glow_ball.riv');
    return file;
  }
}
