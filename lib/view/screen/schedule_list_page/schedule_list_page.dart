import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/core/utils/extensions/string_extension.dart';
import 'package:flutter_base/view/screen/schedule_list_page/widget/schedule_content.dart';
import 'package:flutter_base/view/screen/schedule_list_page/widget/schedule_list_item.dart';
import 'package:flutter_base/view/shared/calendar/app_calendar.dart';

@RoutePage()
class ScheduleListPage extends StatelessWidget {
  const ScheduleListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Schedule List'),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                context.router.pop();
              },
            )),
        backgroundColor: '#F5F5F5'.toColor,
        body: const ScheduleContent(index: 1,));
  }
}
