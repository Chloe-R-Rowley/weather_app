//themes/light_theme.dart

import 'package:flutter/material.dart';

/// Function to build a customized light theme for the app.
///
/// This function customizes various theme properties such as colors, text styles,
/// button styles, and snack bar styles to create a cohesive light theme for the app.
ThemeData buildLightTheme() {
  return ThemeData(
    // Define primary color
    primaryColor: const Color(0xFF6200EA),
    // Define hint color
    hintColor: const Color(0xFF03DAC6),
    // Define light shade of primary color
    primaryColorLight: Colors.blueGrey,
    // Define background color for scaffold
    scaffoldBackgroundColor: const Color(0xFFFAFAFA),
    // Set default font family
    fontFamily: 'Poppins',
    // Define text theme for light mode
    textTheme: const TextTheme(
      // Customize titleLarge text style
      titleLarge: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
        color: Colors.black,
      ),
      // Customize titleMedium text style
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Color(0xFF212121),
      ),
      // Customize titleSmall text style
      titleSmall: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: Color(0xFF303030),
      ),
      // Customize bodyLarge text style
      bodyLarge: TextStyle(
        fontSize: 16,
        color: Color(0xFF424242),
      ),
      // Customize bodyMedium text style
      bodyMedium: TextStyle(
        fontSize: 14,
        color: Color(0xFF616161),
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
        backgroundColor: const Color(0xFF6200EA),
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
