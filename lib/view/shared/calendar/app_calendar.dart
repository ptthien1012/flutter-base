import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/core/core.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppCalendar extends StatefulWidget {
  const AppCalendar({super.key});

  @override
  State<AppCalendar> createState() => _AppCalendarState();
}

class _AppCalendarState extends State<AppCalendar> {
  CalendarController calendarController = CalendarController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
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
            timeSlotViewSettings:
                const TimeSlotViewSettings(timeInterval: Duration(hours: 1)),
            headerHeight: 0,
            viewHeaderHeight: 0,
            controller: calendarController,
          ),
        ),
      ],
    );
  }
}
