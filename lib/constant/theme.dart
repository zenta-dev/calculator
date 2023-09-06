import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    buttonTheme: ButtonThemeData(),
    scaffoldBackgroundColor: Color(0xFF363B4E),
  );

  static ThemeData lightTheme = ThemeData.light().copyWith(
    useMaterial3: true,
    buttonTheme: ButtonThemeData(),
    iconButtonTheme: IconButtonThemeData(),
    scaffoldBackgroundColor: Color(0xFFDED2FF),
  );
}
