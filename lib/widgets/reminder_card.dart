import 'package:flutter/material.dart';
import 'package:minute_keeper/models/app_state.dart';
import 'package:minute_keeper/screens/edit_reminder.dart';
import 'package:minute_keeper/util/reminder.dart';
import 'package:provider/provider.dart';

class ReminderCard extends StatelessWidget {
  final Reminder _reminder;
  final int index;

  ReminderCard(this._reminder, this.index);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditReminderScreen(
                      reminderIndex: this.index,
                    )));
      },
      onLongPress: () {
        _deleteReminder(context);
      },
      child: Container(
          margin: EdgeInsets.all(12.0),
          child: Stack(
            children: <Widget>[
              Container(
                  child: Container(
                height: 80,
                margin: EdgeInsets.only(top: 16.0),
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColorDark.withAlpha(70),
                        blurRadius: 3.0,
                        spreadRadius: 2.0,
                        offset: Offset(3, 3),
                      )
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.autorenew),
                        Text(
                          "Every ${_reminder.frequency} minutes",
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.alarm),
                        Text(
                          "${_reminder.startTime.format(context)} - "
                          "${_reminder.endTime.format(context)}",
                        ),
                      ],
                    )
                  ],
                ),
              )),
              Container(
                  alignment: FractionalOffset(0.5, 0.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).accentColor,
                        borderRadius: BorderRadius.circular(16.0),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).primaryColor,
                            blurRadius: 2.0,
                          )
                        ]),
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                    child: Text(
                      _reminder.name,
                      style: Theme.of(context).textTheme.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
            ],
          )),
    );
  }

  void _deleteReminder(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Delete Reminder"),
            content:
                Text("Are you sure you want to delete \"${_reminder.name}\"?"),
            actions: <Widget>[
              FlatButton(
                child: Text("CANCEL"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              FlatButton(
                child: Text("DELETE"),
                onPressed: () {
                  Provider.of<AppState>(context).removeAt(this.index);
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }
}
