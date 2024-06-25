import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';
import 'package:intl/intl.dart';

class ItemDayCalendarWidget extends StatelessWidget {
  const ItemDayCalendarWidget(
      {super.key,
      required this.date,
      required this.isSelected,
      required this.onTap});
  final DateTime date;
  final bool isSelected;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap.call();
      },
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: isSelected ? buildSelectedDate(context) : buildDate(context),
      ),
    );
  }

  Widget buildDate(BuildContext context) {
    return Container(
      color: Colors.transparent,
      alignment: Alignment.center,
      width: context.screenWidth * 0.17,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            DateFormat('d').format(date),
            style: TextStyle(color: Colors.grey.shade700),
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            date.formatVietnameseWeekday(),
            style: TextStyle(color: Colors.grey.shade700),
          ),
        ],
      ),
    );
  }

  Widget buildSelectedDate(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.blueAccent.shade700,
        width: context.screenWidth * 0.17,
        alignment: Alignment.center,
        child: Text(
          "Hôm\nnay",
          style: context.textTheme.titleLarge?.copyWith(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
