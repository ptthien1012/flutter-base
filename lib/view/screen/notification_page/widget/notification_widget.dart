import 'package:flutter/material.dart';

class DemoNotificationWidget extends StatelessWidget {
  const DemoNotificationWidget({super.key, required this.onTap, required this.title});
  final void Function() onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  child: Flexible(
                    child: SizedBox(
                      child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),

                    ),
                  ),
                ),
                const Icon(Icons.keyboard_arrow_right_outlined)
              ],
            ),
            const SizedBox(height: 8),
            const Row(
              children: [
                Icon(Icons.access_time_outlined, size: 12),
                SizedBox(width: 4),
                Expanded(
                  child: Text(
                    '12:00 PM 01/10/2024',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
