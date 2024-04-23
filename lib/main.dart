import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:timezone/data/latest.dart' as tz;


import 'app/appWidget.dart';
import 'app/configs/appPermissions.dart';
import 'app/service/firebaseService.dart';
import 'app/service/notificationService.dart';

 FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();

  PermissionStatus permissionStatus = await PermissonsConfig().requestfor_Notifications();
  NotificationService().initNotification();
  tz.initializeTimeZones();


  runApp(const FcmAPP());
}


