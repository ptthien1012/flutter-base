import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_base/config/router/main_router.route.dart';
import 'package:flutter_base/core/core.dart';

class ShiftHomeWidget extends StatelessWidget {
  const ShiftHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Ca Tồn",
                style: context.textTheme.headlineLarge
                    ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.replay_rounded,
                size: 18,
              ),
              const SizedBox(
                width: 8,
              ),
              Container(
                width: 1,
                height: 18,
                color: Colors.black,
              ),
              const SizedBox(
                width: 2,
              ),
              IconButton(
                onPressed: () async {
                  await context.router.push(const CalendarRoute());
                },
                icon: const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 24,
                ),
              )
            ],
          ),
          Container(
            height: context.screenWidth * 0.2,
            width: context.screenWidth,
            child: ListView.separated(
                separatorBuilder: (_, __) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      height: context.screenWidth * 0.2,
                      width: 1,
                      color: Colors.grey.shade300,
                    ),
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (_, __) {
                  return Container(
                    width: context.screenWidth * 0.2,
                    height: context.screenWidth * 0.2,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
                  );
                }),
          )
        ],
      ),
    );
  }
}
