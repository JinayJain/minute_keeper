import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:minute_keeper/util/reminder.dart';

class AppState with ChangeNotifier {
  FlutterLocalNotificationsPlugin notifier;

  List<Reminder> _reminderList = new List<Reminder>();

  UnmodifiableListView<Reminder> get reminders =>
      UnmodifiableListView(_reminderList);

  AppState() {
    _initNotifications();
  }

  void _initNotifications() async {
    notifier = new FlutterLocalNotificationsPlugin();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    notifier.initialize(initializationSettings,
        onSelectNotification: handlePayload);

    // Daily confirmation notification

    var dailyTime = Time(8, 0, 0);

    var androidDailySettings = new AndroidNotificationDetails(
        'dailyNotifier',
        'Daily Notifications',
        'Confirms if you want to schedule notifications for the day');
    var iOSDailySettings = new IOSNotificationDetails();
    var dailySettings =
        NotificationDetails(androidDailySettings, iOSDailySettings);

    await notifier
        .showDailyAtTime(
            0,
            'Schedule Reminders?',
            'Tap this notification to schedule today\'s reminders',
            dailyTime,
            dailySettings,
            payload: 'daily')
        .then((_) {
      print("Scheduled daily notification "
          "for ${dailyTime.hour}:${dailyTime.minute}:${dailyTime.second}");
    });
  }

  Future handlePayload(String payload) {
    print('Got the payload ${payload}!');

    if (payload == 'daily') {
      scheduleNotifications();
    }
  }

  void scheduleNotifications() {
    var androidDailySettings = new AndroidNotificationDetails('recurring',
        'Repeating', 'Recurring reminders that the users sets within the app');
    var iOSDailySettings = new IOSNotificationDetails();
    var notifSettings =
        NotificationDetails(androidDailySettings, iOSDailySettings);

    int notifId = 1;

    // TODO setup full scheduling system
    for (Reminder reminder in this._reminderList) {
      DateTime schedulingTime = _toDateTime(reminder.startTime);
      DateTime endTime = _toDateTime(reminder.endTime);

      while (schedulingTime.isBefore(endTime) ||
          schedulingTime.isAtSameMomentAs(endTime)) {
        if (schedulingTime.isAfter(DateTime.now())) {
          this.notifier.schedule(notifId, reminder.name,
              'Tap to view reminder.', schedulingTime, notifSettings);

          notifId++;

          print("${reminder.name} at "
              "${schedulingTime.hour}:${schedulingTime.minute}");
        }

        schedulingTime =
            schedulingTime.add(Duration(minutes: reminder.frequency));
      }

      print("Scheduled ${reminder.name}");
    }

    print("Finished scheduling!");
  }

  DateTime _toDateTime(TimeOfDay t) {
    final DateTime now = DateTime.now();
    return new DateTime(now.year, now.month, now.day, t.hour, t.minute);
  }

  void add(Reminder r) {
    _reminderList.add(r);
    notifyListeners();
  }

  void removeAt(int index) {
    _reminderList.removeAt(index);
    notifyListeners();
  }

  void set(int index, Reminder r) {
    _reminderList[index] = r;
    notifyListeners();
  }
}
