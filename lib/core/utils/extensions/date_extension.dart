import 'package:intl/intl.dart';

extension AppDateTime on DateTime {
  bool isSameDate(
    DateTime date,
  ) {
    return DateTime(year, month, day) ==
        DateTime(date.year, date.month, date.day);
  }

  String formatVietnameseWeekday() {
    final formatter = DateFormat.EEEE('vi_VN');
    final formattedDate = formatter.format(this);

    switch (formattedDate) {
      case 'Thứ Hai':
        return 'Thứ 2';
      case 'Thứ Ba':
        return 'Thứ 3';
      case 'Thứ Tư':
        return 'Thứ 4';
      case 'Thứ Năm':
        return 'Thứ 5';
      case 'Thứ Sáu':
        return 'Thứ 6';
      case 'Thứ Bảy':
        return 'Thứ 7';
      case 'Chủ Nhật':
        return 'CN';
      default:
        return formattedDate;
    }
  }
}
