import 'package:flutter/material.dart';

class Reminder {
  String name;
  int frequency; // in minutes

  TimeOfDay startTime;
  TimeOfDay endTime;

  Reminder(
      {this.name = "New Reminder",
      this.frequency = 30,
      this.startTime = const TimeOfDay(hour: 0, minute: 0),
      this.endTime = const TimeOfDay(hour: 23, minute: 59)});

  Reminder.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      frequency = json['frequency'],
      startTime = _parseTime(json['startTime']),
      endTime = _parseTime(json['endTime']);

  Map<String, dynamic> toJson() =>
      {
        'name': name,
        'frequency': frequency,
        'startTime': _timeToString(startTime),
        'endTime': _timeToString(endTime)
      };

  String _timeToString (TimeOfDay timeOfDay) {
    return _toDateTime(timeOfDay).toIso8601String();
  }

  static TimeOfDay _parseTime(String timeStr) {
      return TimeOfDay.fromDateTime(DateTime.parse(timeStr));
  }

  DateTime _toDateTime(TimeOfDay t) {
    final DateTime now = DateTime.now();
    return new DateTime(now.year, now.month, now.day, t.hour, t.minute);
  }

}
