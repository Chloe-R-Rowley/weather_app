//themes/dark_theme.dart

import 'package:flutter/material.dart';

/// Function to build a customized dark theme for the app.
///
/// This function uses [ThemeData.dark()] as a base and customizes various
/// theme properties such as colors, text styles, button styles, and snack bar styles.
ThemeData buildDarkTheme() {
  return ThemeData.dark().copyWith(
    // Define primary color
    primaryColor: Colors.deepPurpleAccent,
    // Define hint color
    hintColor: Colors.lightBlueAccent,
    // Define light shade of primary color
    primaryColorLight: Colors.blueGrey,
    // Define background color for scaffold
    scaffoldBackgroundColor: const Color(0xFF212121),
    // Define text theme for dark mode
    textTheme: const TextTheme(
      // Customize titleLarge text style
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.white,
      ),
      // Customize titleMedium text style
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Color(0xFFFAFAFA),
      ),
      // Customize titleSmall text style
      titleSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Color(0xFFF5F5F5),
      ),
      // Customize bodyLarge text style
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xFFEEEEEE),
      ),
      // Customize bodyMedium text style
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFFE0E0E0),
      ),
      // Customize bodySmall text style
      bodySmall: TextStyle(
        fontSize: 16,
        color: Color(0xFF212121),
      ),
      // Customize headlineLarge text style
      headlineLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Color(0xFFF5F5F5),
      ),
      // Customize headlineMedium text style
      headlineMedium: TextStyle(
        fontSize: 20,
        color: Color(0xFFEEEEEE),
      ),
      // Customize headlineSmall text style
      headlineSmall: TextStyle(
        fontSize: 18,
        color: Color(0xFFE0E0E0),
      ),
    ),
    // Define elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      // Customize elevated button styles
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: const Color(0xFFD6D6D6),
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
      ),
    ),
    // Define snack bar theme
    snackBarTheme: const SnackBarThemeData(
      // Customize snack bar appearance
      backgroundColor: Colors.red,
      contentTextStyle: TextStyle(color: Color(0xFFBDBDBD)),
    ),
  );
}
