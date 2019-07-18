import 'package:flutter/material.dart';
import 'package:minute_keeper/models/app_state.dart';
import 'package:minute_keeper/util/reminder.dart';
import 'package:provider/provider.dart';

class EditReminderScreen extends StatefulWidget {
  final int reminderIndex;

  EditReminderScreen({Key key, this.reminderIndex = -1}) : super(key: key);

  @override
  _EditReminderScreenState createState() => _EditReminderScreenState();
}

class _EditReminderScreenState extends State<EditReminderScreen> {
  final _nameController = TextEditingController();

  TimeOfDay startTime = TimeOfDay(hour: 0, minute: 0);
  TimeOfDay endTime = TimeOfDay(hour: 23, minute: 59);

  int frequency = 30;

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
              // TODO add empty field and other validation to this
              autocorrect: true,
              autofocus: true,
              controller: _nameController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                  labelText: "Name", hintText: _getName(context)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.alarm),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        RaisedButton(
                          child: Text("${startTime.format(context)}"),
                          onPressed: () {
                            final selectedTime = showTimePicker(
                                context: context, initialTime: TimeOfDay.now());

                            selectedTime.then((value) {
                              setState(() {
                                if (value != null) {
                                  this.startTime = value;
                                }
                              });
                            });
                          },
                        ),
                        Text(" - "),
                        RaisedButton(
                          child: Text("${endTime.format(context)}"),
                          onPressed: () {
                            final selectedTime = showTimePicker(
                                context: context, initialTime: TimeOfDay.now());

                            selectedTime.then((value) {
                              setState(() {
                                if (value != null) {
                                  this.endTime = value;
                                }
                              });
                            });
                          },
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: Icon(Icons.autorenew),
                ),
                Flexible(
                  flex: 9,
                  child: Slider(
                    min: 10,
                    max: 120,
                    divisions: 22,
                    value: this.frequency.toDouble(),
                    onChanged: (newValue) {
                      setState(() {
                        this.frequency = newValue.toInt();
                      });
                    },
                  ),
                ),
                Flexible(
                    flex: 2,
                    child: Text(
                      "${this.frequency} min",
                      style: Theme.of(context).textTheme.subhead,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _submitReminder(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    Reminder newReminder = Reminder(
        name: _nameController.text,
        startTime: this.startTime,
        endTime: this.endTime,
        frequency: this.frequency);

    if (this.widget.reminderIndex == -1) {
      appState.add(newReminder);
    } else {
      appState.set(this.widget.reminderIndex, newReminder);
    }

    Navigator.pop(context);
  }

  String _getName(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    if (widget.reminderIndex != -1) {
      return appState.reminders[widget.reminderIndex].name;
    } else {
      return "My Reminder";
    }
  }
}
