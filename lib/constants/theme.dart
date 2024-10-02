
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: const Color(0xFF6200EE),
    hintColor: const Color(0xFF03DAC6),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Colors.black87,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: Colors.grey,
      ),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF6200EE),
      foregroundColor: Colors.white,
    ),
    buttonTheme: const ButtonThemeData(
      buttonColor: Color(0xFF6200EE),
      textTheme: ButtonTextTheme.primary,
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF6200EE), // Icon color
    ),
    colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.lightBlueAccent,
        onPrimary: Colors.orangeAccent,
        secondary: Colors.cyan,
        onSecondary: CupertinoColors.tertiarySystemGroupedBackground,
        error: Colors.red,
        onError: Colors.red,
        surface: CupertinoColors.systemFill,
        onSurface: Colors.greenAccent),
    // Additional theme settings can be added here
  );
}
