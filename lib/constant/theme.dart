import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    buttonTheme: ButtonThemeData(),
    scaffoldBackgroundColor: Color(0x3C2E1F),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    buttonTheme: ButtonThemeData(),
    iconButtonTheme: IconButtonThemeData(),
    scaffoldBackgroundColor: Color(0xFFFAF6F0),
  );
}
