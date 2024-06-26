import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'package:flutter_base/core/core.dart';

class HealthyNewsWidget extends StatelessWidget {
  const HealthyNewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 8,
        ),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          width: context.screenWidth,
          child: Column(
            children: [
              headerHealthyNewsWidget(context),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                height: 80,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  separatorBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Container(
                        width: 1, // Width of the separator
                        height: 30, // Height of the separator
                        color: Colors.grey.shade400, // Color of the separator
                        margin: const EdgeInsets.only(
                            top: 0.2,
                            bottom: 60), // Center the separator vertically
                      ),
                    );
                  },
                  itemBuilder: (context, index) {
                    return itemHealthyNewsWidget(
                      context: context,
                      name: 'Respontime BT',
                      dailyIndex: '5',
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  itemHealthyStarWidget(
                    context: context,
                    name: 'CSAT DV',
                    dailyIndex: '5',
                  ),
                  itemHealthyStarWidget(
                    context: context,
                    name: 'CSAT DV',
                    dailyIndex: '5',
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
      ],
    );
  }
}

Widget itemHealthyStarWidget({
  required BuildContext context,
  required String name,
  required String dailyIndex,
}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Center(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 2,
              ),
            ],
            borderRadius: const BorderRadius.all(Radius.circular(8))),
        width: context.screenWidth * 0.35,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(name,
                style: const TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    wordSpacing: -1,
                    letterSpacing: -1.5)),
            Row(
              children: [
                Icon(Icons.star, color: Colors.yellow.shade700, size: 24),
                const SizedBox(
                  width: 2,
                ),
                Text(dailyIndex,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Colors.black))
              ],
            )
          ],
        ),
      ),
    ),
  );
}

Widget itemHealthyNewsWidget({
  required BuildContext context,
  required String name,
  required String dailyIndex,
}) {
  return SizedBox(
    width: context.screenWidth * 0.25,
    child: Center(
      child: Column(
        children: [
          SizedBox(
            height: 20,
            child: Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.grey.shade600),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            height: context.screenWidth * 0.1,
            width: context.screenWidth * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey.shade400),
            ),
            child: Center(
              child: Text(
                dailyIndex,
                maxLines: 1,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget headerHealthyNewsWidget(BuildContext context) {
  final dateTimeToShow = DateTime.now().subtract(const Duration(days: 1));
  final dateTimeToShowString = DateFormat('dd/MM/yyyy').format(dateTimeToShow);
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('Bản tin sức khỏe - $dateTimeToShowString',
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              wordSpacing: -1.2,
              letterSpacing: -0.5)),
    ],
  );
}
