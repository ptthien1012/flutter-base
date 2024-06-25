import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_base/view/shared/calendar/event_data_source.dart';
import 'package:flutter_base/view/shared/calendar/event_item.dart';
import 'package:flutter_base/view/shared/calendar/item_day_calendar_widget.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppCalendar extends StatefulWidget {
  const AppCalendar({super.key});

  @override
  State<AppCalendar> createState() => _AppCalendarState();
}

class _AppCalendarState extends State<AppCalendar> {
  CalendarController calendarController = CalendarController();
  List<Appointment> _getDataSource() {
    final List<Appointment> meetings = <Appointment>[];
    final DateTime now = DateTime.now();
    final DateTime startTime = DateTime(now.year, now.month, now.day, 9, 0, 0);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    final DateTime startTime2 =
        DateTime(now.year, now.month, now.day, 10, 0, 0);
    final DateTime startTime3 =
        DateTime(now.year, now.month, now.day, 16, 0, 0);
    final DateTime endTime2 = startTime3.add(const Duration(hours: 2));
    meetings
      ..add(Appointment(
        startTime: startTime,
        endTime: endTime,
        subject: 'Conference',
        color: Colors.blue,
      ))
      ..add(Appointment(
        startTime: startTime2,
        endTime: endTime,
        subject: 'Demo',
        color: Colors.blue,
      ))
      ..add(Appointment(
        startTime: startTime3,
        endTime: endTime2,
        subject: 'Demo',
        color: Colors.blue,
      ));

    return meetings;
  }

  late List<DateTime> _date;
  // generate list date 30 days from now
  List<DateTime> _generateDate() {
    final List<DateTime> dates = <DateTime>[];
    final DateTime now = DateTime.now();
    for (int i = 0; i < 30; i++) {
      dates.add(DateTime(now.year, now.month, now.day + i));
    }
    return dates;
  }

  final ScrollController dayScrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    _date = _generateDate();
    super.initState();
  }

  Future<void> _animateToIndex(int index) async {
    final offset = index * context.screenWidth * 0.17; // Calculate the offset
    await dayScrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration:
              BoxDecoration(border: Border.all(color: Colors.grey.shade300)),
          height: 70,
          width: context.screenWidth,
          child: ListView.separated(
              controller: dayScrollController,
              physics: const ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ItemDayCalendarWidget(
                  onTap: () {
                    calendarController.displayDate = _date[index];
                    setState(() {});
                  },
                  date: _date[index],
                  isSelected: calendarController.displayDate?.isSameDate(
                        _date[index],
                      ) ??
                      false,
                );
              },
              separatorBuilder: (context, index) {
                return Container(
                  width: 1,
                  height: 60,
                  color: Colors.grey.shade300,
                );
              },
              itemCount: _date.length),
        ),
        Expanded(
          child: SfCalendar(
            view: CalendarView.day,
            dataSource: EventDataSource(_getDataSource()),
            timeSlotViewSettings: const TimeSlotViewSettings(
                timeInterval: Duration(hours: 1),
                timelineAppointmentHeight: 100),
            headerHeight: 0,
            viewHeaderHeight: 0,
            onViewChanged: (_) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                // Reset the display date to the original date to prevent swiping
                setState(() {});
                _animateToIndex(_date.indexWhere((element) =>
                    element.isSameDate(calendarController.displayDate!)));
              });
            },
            controller: calendarController,
            appointmentBuilder: (context, details) {
              return EventItem(calendarAppointmentDetails: details);
            },
          ),
        ),
      ],
    );
  }
}
