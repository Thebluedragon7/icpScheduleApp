import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ICPNotificationAPI {
  // defining flutter Notification
  static final _notifications = FlutterLocalNotificationsPlugin();

  // Future Function awaiting notification details
  static Future _icpNotificationDetail() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channel ID',
        'channel Name',
        channelDescription: 'channel Description',
        importance: Importance.max
      ),
      iOS: IOSNotificationDetails()
    );
  }

  // showNotification Method to invoke Notification
  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(
          id,
          title,
          body,
          await _icpNotificationDetail(),
        payload: payload
      );
}
