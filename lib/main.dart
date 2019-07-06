
import 'package:flutter/material.dart';
import 'package:minute_keeper/screens/home.dart';
import 'package:minute_keeper/styles/main_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MainTheme().theme,
      title: 'Minute Keeper',
      home: HomeScreen()
    );
  }
}