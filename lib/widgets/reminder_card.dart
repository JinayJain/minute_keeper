import 'package:flutter/material.dart';
import 'package:minute_keeper/util/reminder.dart';
import 'package:minute_keeper/screens/edit_reminder.dart';

class ReminderCard extends StatelessWidget {

  final Reminder _reminder;

  ReminderCard(this._reminder);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => EditReminderScreen())
        );
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
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor,
                      blurRadius: 2.0,

                    )
                  ]
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(Icons.autorenew),
                        Text("Every ${_reminder.frequency} minutes",)
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Icon(Icons.alarm),
                        Text("${_reminder.endTime.format(context)} - ${_reminder.startTime.format(context)}",),
                      ],
                    )
                  ],
                ),
              )
            ),
            Container(
              alignment: FractionalOffset(0.5, 0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorLight,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context).primaryColor,
                      blurRadius: 2.0,
                    )
                  ]
                ),
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
                child: Text(
                  _reminder.name,
                  style: Theme.of(context).textTheme.headline,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            )
          ],
        )
      ),
    );
  }
}