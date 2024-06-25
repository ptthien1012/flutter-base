import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/config/router/main_router.route.dart';
import 'package:flutter_base/core/core.dart';

class AppBarHomeWidget extends StatelessWidget {
  const AppBarHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                height: context.screenWidth * 0.08,
                width: context.screenWidth * 0.08,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey.shade500),
                ),
              ),
              Positioned(
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Container(
                    height: context.screenWidth * 0.03,
                    width: context.screenWidth * 0.03,
                    decoration: const BoxDecoration(
                      color: Colors.greenAccent,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'ISC02.KieuPTP5',
                style: textTheme.headlineSmall
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Text(
                'ICS - Q1 - 002',
                style:
                    textTheme.bodySmall?.copyWith(color: Colors.grey.shade600),
              ),
            ],
          ),
          const Expanded(child: SizedBox()),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () async {
              await context.pushRoute(const CalendarRoute());
            },
            icon: const Icon(
              Icons.calendar_month_rounded,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () async {
              await context.pushRoute(const NotificationListRoute());
            },
            icon: const Icon(
              Icons.notifications_rounded,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
