import 'package:flutter/material.dart';


class MainTheme {

  static const Color primaryColor = Color(0xff334d99);
  static const Color primaryColorDark = Color(0xff4060bf);
  static const Color primaryColorLight = Color(0xff798fd2);

  static const Color accentColor = Color(0xffa2cedd);

  ThemeData theme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: primaryColor,
    primaryColorLight: primaryColorDark,
    primaryColorDark: primaryColorLight,

    accentColor: accentColor,

    canvasColor: primaryColor,

    backgroundColor: primaryColorLight,
    scaffoldBackgroundColor: primaryColorLight,

    textTheme: TextTheme(
      title: TextStyle(fontFamily: 'Raleway'),
      headline: TextStyle(fontFamily: 'Raleway', fontSize: 16.0, fontWeight: FontWeight.w500),
      body1: TextStyle(fontFamily: 'OpenSans'),
    )
  );
}