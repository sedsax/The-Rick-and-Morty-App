import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._(); // this basically makes it so you can't instantiate this class
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'Inter',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF42B4CA),
          secondary: Color(0xFFD5E9ED),
          error: Color(0xFFEA7979),
          surface: Colors.white,
          onSurface: Color(0xFF414A4C),
          tertiary: Color(0xFFB5C4C7),
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(foregroundColor: const Color(0xFF42B4CA)),
        ),
      );
}
