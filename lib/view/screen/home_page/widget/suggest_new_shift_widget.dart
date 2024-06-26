import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/config/router/main_router.route.dart';
import 'package:flutter_base/core/core.dart';
import 'package:flutter_base/view/screen/home_page/widget/item_suggest_new_shift_widget.dart';

class SuggestNewShiftWidget extends StatelessWidget {
  const SuggestNewShiftWidget({super.key});

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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Text(
                  "Gợi ý ca vụ tiếp theo",
                  style: context.textTheme.headlineLarge
                      ?.copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const Expanded(child: SizedBox()),
                const Icon(
                  Icons.replay_rounded,
                  size: 18,
                ),
                const Icon(
                  Icons.keyboard_arrow_right_rounded,
                  size: 24,
                ),
              ],
            ),
          ),
          const ItemSuggestNewShiftWidget(),
          const SizedBox(
            height: 16,
          ),
          const ItemSuggestNewShiftWidget()
        ],
      ),
    );
  }
}
