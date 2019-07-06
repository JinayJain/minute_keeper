import 'package:flutter/material.dart';

class Reminder {
  String name;
  int frequency; // in minutes

  TimeOfDay startTime;
  TimeOfDay endTime;

  Reminder({
    this.name, 
    this.frequency = 30, 
    this.startTime = const TimeOfDay(hour: 0, minute: 0), 
    this.endTime = const TimeOfDay(hour: 23, minute: 59)});
}