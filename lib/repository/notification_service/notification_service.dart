import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

const String channelName = 'Demo Test';
const String channelId = "com.tarun.basic_code_getx";
const String channelDesc = "This is channel description";
AndroidNotificationChannel channel = const AndroidNotificationChannel(
  channelId, channelName,
  importance: Importance.max,
  description: channelDesc,
  enableVibration: true,
  playSound: true,
  //sound: RawResourceAndroidNotificationSound('notification'),
);

class NotificationService {
  NotificationService._();

  static final instance = NotificationService._();
  static FlutterLocalNotificationsPlugin flNotification =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      requestSoundPermission: true,
      requestBadgePermission: true,
      requestAlertPermission: true,
    );

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
      macOS: initializationSettingsDarwin,
    );
    await flNotification.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
    await flNotification
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestPermission();
    await flNotification
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
  }

  Future<void> showNotification(
    String title,
    String body, {
    String? payload,
  }) async {
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
        channelId, channelName,
        channelDescription: channelDesc,
        importance: Importance.max,
        priority: Priority.high,
        icon: 'app_icon',
        playSound: true,
        showWhen: true,
        enableVibration: true,
        channelShowBadge: true,
        visibility: NotificationVisibility.public,
        //sound: RawResourceAndroidNotificationSound('notification'),
        autoCancel: false,
      ),
      iOS: DarwinNotificationDetails(
        presentAlert: true,
        presentBadge: true,
        presentSound: true,
      ),
    );
    await flNotification.show(
      Random().nextInt(4),
      title,
      body,
      platformChannelSpecifics,
      payload: payload ?? '',
    );
  }
}
