import 'package:flutter/material.dart';
import 'package:minute_keeper/util/reminder.dart';

class EditReminderScreen extends StatelessWidget {

  final _nameController = TextEditingController();


  Reminder reminder;

  EditReminderScreen(Reminder rem){

    // TODO make cursor start at the end of the name
    this._nameController.text = rem.name;
    this.reminder = rem;
  }

  EditReminderScreen.newReminder(){
    this.reminder = Reminder();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: <Widget>[
            Text("DONE"),
            Icon(Icons.check),
          ],
        ),
        onPressed: () {
          _submitReminder(context);
        },
      ),
      appBar: AppBar(
        title: Text("Edit Reminder"),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            TextField(
              controller: _nameController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                labelText: "Name",
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _submitReminder(BuildContext context){
    Reminder newReminder = Reminder(
      name: _nameController.text
    );

    Navigator.pop(context, newReminder);
  }
}
