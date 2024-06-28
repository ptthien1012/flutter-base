import 'package:flutter/material.dart';
import 'package:flutter_base/core/core.dart';

class ScheduleListItem extends StatelessWidget {
  const ScheduleListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          itemHeader(
              context: context, title: 'Swap 6', contractID: 'SGFDN1027'),
          const SizedBox(height: 8),
          itemInfo(),
          const Divider(
            color: Colors.grey,
          ),
          customerInfo(),
          const SizedBox(height: 8),
          Container(
            height: context.screenWidth * 0.1,
            width: context.screenWidth,
            child: ListView.separated(
                separatorBuilder: (_, __) {
                  return const VerticalDivider(
                    thickness: 1,
                    color: Colors.grey,
                    indent: 8,
                    endIndent: 8,
                  );
                },
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (_, __) {
                  return Container(
                    height: context.screenWidth * 0.05,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.receipt_long_rounded,
                          size: 24,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text("Triển khai")
                      ],
                    ),
                  );
                }),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Check in',
                        style: TextStyle(color: Colors.white))),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.person_add),
                        const SizedBox(width: 4),
                        Text('Ghép cặp'),
                      ],
                    )),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                    child: const Text('Tích hẹn')),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget pageHeader() {
    return Container(
      padding: const EdgeInsets.all(8),
      child:Row(
        children: [

        ],
      ),
    );
  }

  Widget searchBar() {
    return Container();
  }

  Widget itemHeader(
      {required BuildContext context, String? title, String? contractID}) {
    return IntrinsicHeight(
      child: Row(
        children: [
          const Icon(Icons.receipt_long_rounded),
          Text(title ?? ''),
          const VerticalDivider(
            thickness: 1,
            color: Colors.grey,
            indent: 4,
            endIndent: 4,
          ),
          RichText(
            text: TextSpan(
              text: 'Số HĐ: ',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
              children: [
                TextSpan(
                  text: contractID ?? '',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget itemInfo() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Column(
        children: [
          Row(children: [
            Text('Thông tin phiếu #5'),
            Spacer(),
            Icon(Icons.timer_sharp),
            Text('Tồn: 1:22:00'),
          ]),
          SizedBox(width: 8),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TG tạo'),
                    Text('TG hẹn'),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('10/06/2024 10:30:00'),
                    Text('18/06/2024 16:30:00'),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }

  Widget customerInfo() {
    return Container(
      padding: const EdgeInsets.all(8),
      child: const Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tên khách hàng'),
                    Text('SĐT'),
                    Text('Địa chỉ'),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nguyễn Văn A'),
                    Text('0123456789'),
                    Text(
                        'Lô 29-31-33B Tân Thuận Động P. Tân Thuận Đông, Q.7, TP.HCM'),
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
