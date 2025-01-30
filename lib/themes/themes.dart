import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: Colors.white,
        primary: Color(0xFFF0F4F9),
        secondary: Color(0xFFFDFFFF),
        onSurface: Colors.black,
        onPrimary: Colors.black,
        onSecondary: Color(0xFF9B9EA6)));

ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark(
      surface: Color(0xFF0D1333),
      primary: Color(0xFF252948),
      secondary: Color(0xFF383D57),
      onSurface: Colors.white,
      onPrimary: Colors.white,
      onSecondary: Color(0xFF6E738F),
    ));
