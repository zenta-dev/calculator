import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData darkTheme = ThemeData.dark().copyWith(
    useMaterial3: true,
    buttonTheme: ButtonThemeData(),
  );
  static ThemeData lightTheme = ThemeData.light().copyWith(
      useMaterial3: true,
      buttonTheme: ButtonThemeData(),
      iconButtonTheme: IconButtonThemeData());
}
