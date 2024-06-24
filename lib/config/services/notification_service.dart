import 'package:permission_handler/permission_handler.dart';

class NotificationService {
  Future<bool> checkNotificationPermission() async {
    final status = await Permission.notification.isGranted;

    return status;
  }

  Future<void> askNotificationPermission() async {
    await Permission.notification.request();
  }
}