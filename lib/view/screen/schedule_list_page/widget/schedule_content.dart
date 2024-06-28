import 'package:flutter/material.dart';
import 'package:flutter_base/view/screen/schedule_list_page/widget/schedule_list_item.dart';
import 'package:flutter_base/view/shared/calendar/app_calendar.dart';

class ScheduleContent extends StatelessWidget {
  const ScheduleContent({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        initialIndex: index,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            pageHeader(),
            Expanded(
              child: TabBarView(children: [
                const AppCalendar(),
                ListView(
                  shrinkWrap: true,
                  children: const [
                    ScheduleListItem(),
                    SizedBox(height: 8),
                    ScheduleListItem(),
                  ],
                )
              ]),
            )
          ],
        ));;
  }

  Widget pageHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      child: Row(children: [
        scheduleTabBar(),
        const SizedBox(width: 8),
        scheduleSearchBox(),
        const SizedBox(width: 8),
        Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.black)),
            padding: const EdgeInsets.all(2),
            child: const Icon(Icons.filter_list_outlined, size: 20,)),
        const SizedBox(width: 8),
        const Text('Lọc', style: TextStyle(fontSize: 16)),
      ]),
    );
  }

  Widget scheduleTabBar() {
    return SizedBox(
      height: 40,
      width: 80,
      child: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: Colors.grey,
        indicator: BoxDecoration(
          color: Colors.black12, // White background for selected tab
          borderRadius: BorderRadius.circular(8),
        ),
        indicatorSize: TabBarIndicatorSize.tab,
        padding: EdgeInsets.zero,
        // Remove default padding
        labelPadding: EdgeInsets.zero,
        // Remove label padding
        tabs: const [
          Tab(
            child: Icon(Icons.calendar_month_outlined),
          ),
          Tab(
            child: Icon(Icons.list),
          ),
        ],
      ),
    );
  }

  Widget scheduleSearchBox() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.grey),
        ),
        child: const Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 8),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Tìm SĐT, SHĐ..',
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
