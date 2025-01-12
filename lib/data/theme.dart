import 'package:flutter/material.dart';
import 'package:codi/data/globals.dart' as globals;

ThemeData mainTheme = ThemeData(
  colorScheme: const ColorScheme(
    // brightness: Brightness.light,
    // primary: Color(0xFF6B27FE),
    // onPrimary: Color(0xFFFFFFFF),
    // secondary: Color(0xFF2E2E35),
    // onSecondary: Color(0xFFFFFFFF),
    // error: Color(0xFFF94949),
    // onError: Color(0xFFFFFFFF),
    // background: Color(0xFFFFFFFF),
    // onBackground: Color(0xFF2E2E35),
    // surface: Color(0xFFFFFFFF),
    // onSurface: Color(0xFF2E2E35),

    brightness: Brightness.light,
    primary: globals.Colors.point1,
    onPrimary: globals.Colors.sub3,
    secondary: globals.Colors.point2,
    onSecondary: globals.Colors.sub3,
    error: globals.Colors.point3,
    onError: globals.Colors.sub3,
    background: globals.Colors.sub3,
    onBackground: globals.Colors.point2,
    surface: globals.Colors.sub3,
    onSurface: globals.Colors.point2,
  ),
  fontFamily: "Pretendard",
);
