
import 'package:flutter/material.dart';
import 'package:minute_keeper/screens/home.dart';
import 'models/app_state.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: _buildDarkTheme(),
      title: 'Minute Keeper',
      home: AppState(
        child: HomeScreen()
      )
    );
  }
}

const Color primaryColor = Color(0xff2e294e);
const Color primaryColorDark = Color(0xff221e39);
const Color primaryColorLight = Color(0xff413c5e);

const Color accentColor = Color(0xffa6ece0);
const Color secondaryAccent= Color(0xff7adfbb);

const Color lightTextColor = Color(0xfff7f5fa);
const Color darkTextColor = Color(0xff181623);

const Color errorColor = Color(0xffea5d67);

const ColorScheme mainColors = ColorScheme(
  primary: primaryColor,
  primaryVariant: primaryColorDark,
  secondary: accentColor,
  secondaryVariant: secondaryAccent,
  surface: primaryColorLight,
  background: primaryColorLight,
  error: errorColor,
  onPrimary: lightTextColor,
  onSecondary: darkTextColor,
  onSurface: lightTextColor,
  onBackground: lightTextColor,
  onError: lightTextColor,
  brightness: Brightness.dark
);


ThemeData _buildDarkTheme(){
  final ThemeData base = ThemeData.dark();

  return base.copyWith(
    colorScheme: mainColors,

    primaryColor: primaryColor,
    primaryColorDark: primaryColorDark,
    primaryColorLight: primaryColorLight,

    accentColor: accentColor,

    scaffoldBackgroundColor: primaryColorLight,

    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0)
      ),
    ),

    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.0)
      ),
      elevation: 8.0
    ),

    canvasColor: primaryColor,

    textTheme: _buildTextTheme(base.textTheme),
  );
}

TextTheme _buildTextTheme(TextTheme base){
  return base.copyWith(
    title: TextStyle(fontFamily: 'Raleway'),
    subtitle: TextStyle(fontFamily: 'Raleway', color: darkTextColor, fontSize: 16.0),
    body1: TextStyle(color: lightTextColor),

  );
}