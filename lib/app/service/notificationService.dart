import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  final FlutterLocalNotificationsPlugin notificationsPlugin =
  FlutterLocalNotificationsPlugin();

  Future<void> initNotification() async {
    try {
      tz.initializeTimeZones();

      AndroidInitializationSettings initializationSettingsAndroid =
      const AndroidInitializationSettings('@mipmap/ic_launcher');

      var initializationSettings = InitializationSettings(
          android: initializationSettingsAndroid);
      await notificationsPlugin.initialize(initializationSettings);
    } catch (e) {
      print('Error initializing notifications: $e');
    }
  }

  NotificationDetails notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails(
        'channelId',
        'channelName',
        channelDescription: 'Channel description',
        importance: Importance.max,
      ),
    );
  }

  Future<void> showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    try {
      await notificationsPlugin.show(
        id,
        title,
        body,
        await notificationDetails(),
        payload: payload,
      );
    } catch (e) {
      print('Error showing notification: $e');
    }
  }

  Future<void> scheduleNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
    required DateTime scheduledNotificationDateTime,
  }) async {
    try {
      await notificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime.from(
          scheduledNotificationDateTime,
          tz.local,
        ),
        await notificationDetails(),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
        UILocalNotificationDateInterpretation.absoluteTime,
        payload: payload,
      );
    } catch (e) {
      print('Error scheduling notification: $e');
    }
  }
}
