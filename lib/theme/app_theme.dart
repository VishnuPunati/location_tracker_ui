import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF6750A4);
  static const Color secondary = Color(0xFF00BFA6);
  static const Color bg = Color(0xFFF3EDF7);
  static const Color cardBg = Colors.white;
  static const Color danger = Color(0xFFE53935);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: bg,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      primary: primary,
      secondary: secondary,
      onSurface: bg,
    ),
    cardTheme: CardThemeData(
      color: cardBg,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 6),
    ),
    appBarTheme: const AppBarTheme(elevation: 0, centerTitle: false),
  );
}
