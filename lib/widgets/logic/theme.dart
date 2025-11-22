import 'package:flutter/material.dart';

class AppTheme {
  static bool isDark = true;
  static ThemeData get dark => ThemeData(
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.grey),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    ),
    scaffoldBackgroundColor: const Color(0xff0A1B39),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xff0A1B39),
      selectedItemColor: const Color(0xff588BF0),
      unselectedItemColor: Colors.white,
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: Colors.white54),
      filled: true,
      fillColor: const Color(0xff13254F),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      suffixIconColor: Colors.white,
    ),
    useMaterial3: true,
  );

  static ThemeData get light => ThemeData(
    appBarTheme: const AppBarTheme(
      surfaceTintColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.grey),
      bodyMedium: TextStyle(color: Colors.black),
      bodySmall: TextStyle(color: Colors.black87),
    ),
    scaffoldBackgroundColor: const Color(0xffF6F5F4),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      showUnselectedLabels: false,
      showSelectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: const Color(0xffF6F5F4),
      selectedItemColor: const Color(0xff588BF0),
      unselectedItemColor: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey.shade200,
      hintStyle: const TextStyle(color: Colors.black54),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      suffixIconColor: Colors.black,
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    useMaterial3: true,
  );
}
