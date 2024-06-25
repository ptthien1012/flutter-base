import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';

class ReceiverWidget extends StatelessWidget {
  const ReceiverWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.receipt_long_rounded,
            size: 24,
          ),
          const SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Thu cước',
                style: context.textTheme.headlineLarge?.copyWith(fontSize: 12),
              ),
              Text(
                "Bạn có 8 hợp đồng thu cước trước hạn --/--/----",
                style: context.textTheme.labelSmall?.copyWith(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
