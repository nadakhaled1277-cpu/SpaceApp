import 'package:flutter/material.dart';

class AppTheme {
  static const background = Colors.black;
  static const action = Color(0xFFF44845);
  static final dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    scaffoldBackgroundColor: background,
    fontFamily: 'Roboto',
    colorScheme: const ColorScheme.dark(primary: action, surface: background),
  );
}
