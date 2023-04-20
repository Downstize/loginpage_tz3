// initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
// ignore_for_file: unused_import

// import 'package:flutter/cupertino.dart';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

// class NotificationApi {
//   static final _notifications = FlutterLocalNotificationsPlugin();

//   static Future _notificationDetails() async {
//     return NotificationDetails(
//       android: AndroidNotificationDetails(
//         'channel id',
//         'channel name',
//         importance: Importance.max,
//       ),
//       iOS: IOSNotificationDetails(),
//     );
//   }

//   static Future showNotification({
//     int id = 0,
//     String? title,
//     String? body,
//     String? payload,
//   }) async =>
//     _notifications.show(
//       id,
//       title,
//       body,
//       await _notificationDetails(),
//       payload: payload,
//     );
// }

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static final NotificationService _notificationService =
      NotificationService._internal();
  final BehaviorSubject<String> onNotificationClick = BehaviorSubject();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> init() async {
    final AndroidInitializationSettings initizalizationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestAlertPermission: true,
      requestBadgePermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initizalizationSettingsAndroid,
      iOS: initializationSettingsIOS,
      macOS: null,
    );

    bool? initialized = await flutterLocalNotificationsPlugin.initialize(
        initializationSettings, onDidReceiveNotificationResponse: (response) {
      log(response.payload.toString());
    });

    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('notification_permissions_granted', true);

    log("Initialized: $initialized");
  }

  Future<bool> checkNotificationPermissions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('notification_permissions_granted') ?? false;
  }

  Future<NotificationDetails> _notificationDetails() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('Shalom', 'Shalom',
            importance: Importance.high,
            priority: Priority.max,
            playSound: true);

    const DarwinNotificationDetails iOSPlatformChannelSpecifics =
        DarwinNotificationDetails(
      presentAlert:
          true, // Present an alert when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
      presentBadge:
          true, // Present the badge number when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
      presentSound:
          true, // Play a sound when the notification is displayed and the application is in the foreground (only from iOS 10 onwards)
      //sound: String?,  // Specifics the file path to play (only from iOS 10 onwards)
      badgeNumber: 1, // The application's icon badge number
      //attachments: List<IOSNotificationAttachment>?, (only from iOS 10 onwards)
      subtitle: 'GG WP', //Secondary description  (only from iOS 10 onwards)
      threadIdentifier: 'thread_id', //(only from iOS 10 onwards)
    );

    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iOSPlatformChannelSpecifics,
    );
  }

  Future<void> showNotification({
    required id,
    required String title,
    required String body,
  }) async {
    final details = await _notificationDetails();
    await flutterLocalNotificationsPlugin.show(id, title, body, details);
  }

  Future<void> setnotifications({
    required int id,
    required String title,
    required String body,
    required DateTime date,
  }) async {
    final details = await _notificationDetails();
    for (var i = 0; i < 309; i += 14) {
      date = date.add(Duration(days: i));
      await flutterLocalNotificationsPlugin.zonedSchedule(
          id + i,
          title,
          body,
          tz.TZDateTime.now(tz.local).add(
            const Duration(seconds: 5),
          ),
          details,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          androidAllowWhileIdle: true);
    }
  }

  Future<void> showScheduledNotification(
      {required int id,
      required String title,
      required String body,
      required int day,
      required int mounth,
      required int minute,
      required int hour}) async {
    final details = await _notificationDetails();
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(
        DateTime(2022, mounth, day, hour, minute),
        tz.local,
      ),
      details,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> showRepeatNotification({
    required int id,
    required String title,
    required String body,
    // required int day,
    // required int month,
    // required int minute,
    // required int hour
  }) async {
    final details = await _notificationDetails();
    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.weekly,
      details,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> showNotificationWithPayload(
      {required int id,
      required String title,
      required String body,
      required String payload}) async {
    final details = await _notificationDetails();
    await flutterLocalNotificationsPlugin.periodicallyShow(
      id,
      title,
      body,
      RepeatInterval.weekly,
      details,
      payload: payload,
    );
  }

  Future<void> cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
    //await flutterLocalNotificationsPlugin.cancel(NOTIFICATION_ID);
  }

  Future onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) async {
    print('id $id');
  }

  Future selectNotification(String? payload) async {
    print('payload $payload');
    if (payload != null && payload.isNotEmpty) {
      onNotificationClick.add(payload);
    }
  }
}
