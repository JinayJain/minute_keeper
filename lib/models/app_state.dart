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
    notifier = new FlutterLocalNotificationsPlugin();

    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOS = IOSInitializationSettings();
    var initializationSettings = new InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    notifier.initialize(initializationSettings);

    // TODO setup notification scheduling system
  }

  void add(Reminder r) async {
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
