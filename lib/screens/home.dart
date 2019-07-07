import 'package:flutter/material.dart';
import 'package:minute_keeper/util/reminder.dart';
import 'package:minute_keeper/widgets/reminder_card.dart';
import 'edit_reminder.dart';
import 'package:minute_keeper/models/app_state.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 32.0,
          ),
          onPressed: () async {
            final result = await Navigator.push(context,
                MaterialPageRoute(
                    builder: (context) => EditReminderScreen.newReminder()));

            _getReminders(context).add(result);
          },
        ),
        appBar: AppBar(
          title: Text(
            "Minute Keeper",
            style: Theme.of(context).textTheme.title,
          )
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              title: Text("Reminders"),
              icon: Icon(Icons.check_circle_outline)
            ),
            BottomNavigationBarItem(
              title: Text("Statistics"),
              icon: Icon(Icons.timeline)
            ),
            BottomNavigationBarItem(
              title: Text("Account"),
              icon: Icon(Icons.account_circle)
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: _getReminders(context).length,
          itemBuilder: (BuildContext context, int index) {
            return ReminderCard(_getReminders(context)[index]);
          },
        ));
  }

  List<Reminder> _getReminders(BuildContext context) {
    return AppState.of(context).reminderList;
  }

}
