import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';

class ItemSuggestNewShiftWidget extends StatelessWidget {
  const ItemSuggestNewShiftWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade300, shape: BoxShape.circle),
          width: context.screenWidth * 0.06,
          height: context.screenWidth * 0.06,
          child: Icon(
            Icons.handyman,
            color: Colors.grey.shade700,
            size: context.screenWidth * 0.035,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '7:00 AM| SGH25456',
              style: context.textTheme.bodySmall?.copyWith(
                fontSize: 12,
              ),
            ),
            Text(
              'Lô B3 Đ. Sáng Tạo, Tân Thuận Đông, Quận 7, Thành phố ....',
              style: context.textTheme.bodySmall?.copyWith(
                color: Colors.grey.shade600,
                fontSize: 8,
              ),
            )
          ],
        ),
        const Expanded(child: SizedBox()),
        Icon(
          Icons.u_turn_left_outlined,
          color: Colors.grey.shade600,
          size: 8,
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          '(5.0km)',
          style: context.textTheme.bodySmall?.copyWith(
            color: Colors.grey.shade600,
            fontSize: 8,
          ),
        ),
      ],
    );
  }
}
