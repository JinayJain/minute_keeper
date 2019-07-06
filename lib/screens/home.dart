import 'package:flutter/material.dart';
import 'package:minute_keeper/util/reminder.dart';
import 'package:minute_keeper/widgets/reminder_card.dart';
import 'edit_reminder.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Reminder> reminders;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            size: 32.0,
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditReminderScreen()));
          },
        ),
        appBar: AppBar(title: Text("Minute Keeper")),
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
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return ReminderCard(Reminder(name: "I am a little boy with big dreams"));
          },
        ));
  }
}
