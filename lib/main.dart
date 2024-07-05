//main.dart

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/home_screen.dart';
import 'package:weather_app/themes/dark_theme.dart';
import 'package:weather_app/themes/light_theme.dart';

void main() async {
  await dotenv.load(fileName: '/.env');
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherProvider(), // Initialize WeatherProvider as a ChangeNotifier
      child: const MyApp(), // Wrap the app with MyApp widget
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key}); // Constructor for MyApp widget

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App', // App title displayed in the operating system's task switcher
      theme: buildLightTheme(), // Use light theme defined in light_theme.dart
      darkTheme: buildDarkTheme(), // Use dark theme defined in dark_theme.dart
      themeMode: ThemeMode.system, // Use system-defined theme mode (light or dark)
      home: const HomeScreen(), // Set HomeScreen as the default screen of the app
      debugShowCheckedModeBanner: false,
    );
  }
}
