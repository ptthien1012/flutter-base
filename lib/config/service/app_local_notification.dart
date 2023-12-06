import 'dart:async';

import 'package:flutter_base/core/app/injection/injection.dart';
import 'package:flutter_base/generated/assets.gen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Handle notification tap in background
@pragma('vm:entry-point')
void notificationTapBackground(NotificationResponse notificationResponse) {
  // ignore: avoid_print
  print('notification(${notificationResponse.id}) action tapped: '
      '${notificationResponse.actionId} with'
      ' payload: ${notificationResponse.payload}');
  if (notificationResponse.input?.isNotEmpty ?? false) {
    // ignore: avoid_print
    print(
        'notification action tapped with input: ${notificationResponse.input}');
  }
}

class AppLocalNotification {
  StreamController<NotificationResponse> initStreamListenerNotification() {
    final StreamController<NotificationResponse> streamController =
        StreamController<NotificationResponse>.broadcast();

    streamController.stream.listen((event) {
      // Handle when notification tap in foreground
    });
    return streamController;
  }

  Future<FlutterLocalNotificationsPlugin> initLocalNotification() async {
    final streamController =
        getIt.get<StreamController<NotificationResponse>>();

    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(Assets.images.demo.path);
    final InitializationSettings initializationSettings =
        InitializationSettings(
      iOS: initializationSettingsIOS,
      android: initializationSettingsAndroid,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveBackgroundNotificationResponse: (detail) {
      streamController.add(detail);
    }, onDidReceiveNotificationResponse: (detail) {
      notificationTapBackground(detail);
    });
    return flutterLocalNotificationsPlugin;
  }
}
