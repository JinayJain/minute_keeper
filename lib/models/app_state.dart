import 'package:flutter/material.dart';
import 'package:minute_keeper/util/reminder.dart';


class AppState extends InheritedWidget{

  final List<Reminder> reminderList = new List<Reminder>();

  AppState({ Widget child }) : super(child: child);

  @override
  bool updateShouldNotify(InheritedWidget old){
    return true;
  }

  static AppState of(BuildContext context){
    return context.inheritFromWidgetOfExactType(AppState);
  }
}