import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class EventItem extends StatelessWidget {
  const EventItem({super.key, required this.calendarAppointmentDetails});
  final CalendarAppointmentDetails calendarAppointmentDetails;

  @override
  Widget build(BuildContext context) {
    final Appointment appointment =
        calendarAppointmentDetails.appointments.first;
    return ClipRRect(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      child: Stack(
        children: [
          Container(
            width: calendarAppointmentDetails.bounds.width,
            height: calendarAppointmentDetails.bounds.height,
            color: appointment.color,
          ),
          Positioned(
            left: 3.5,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(
                Radius.circular(8),
              ),
              child: Container(
                  width: calendarAppointmentDetails.bounds.width,
                  height: calendarAppointmentDetails.bounds.height,
                  color: Colors.white.withOpacity(0.9),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${DateFormat('hh:mm a').format(appointment.startTime)} | ${appointment.subject}',
                        style: context.textTheme.labelSmall
                            ?.copyWith(color: appointment.color.withOpacity(1)),
                      ),
                      Text('Nguyễn văn đề mô',
                          style: context.textTheme.labelSmall
                              ?.copyWith(color: Colors.black))
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
