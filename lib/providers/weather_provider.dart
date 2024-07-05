//providers/weather_provider.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/widgets/weather_error_handler.dart'; // Import error handler

/// WeatherProvider class that extends ChangeNotifier to manage and notify about weather data state
class WeatherProvider extends ChangeNotifier {
  // Private member variables
  final WeatherService _weatherService = WeatherService(); // Instance of WeatherService to fetch weather data
  Weather? _weather; // Stores the fetched weather data
  bool _isLoading = false; // Indicates whether the weather data is being fetched
  String? _errorMessage; // Stores error message if any error occurs during data fetch

  // Getters to access private member variables
  Weather? get weather => _weather; // Getter for weather data
  bool get isLoading => _isLoading; // Getter for loading state
  String? get errorMessage => _errorMessage; // Getter for error message

  /// Fetches weather data for the given city
  Future<void> fetchWeather(String city) async {
    _isLoading = true; // Set loading state to true
    _errorMessage = null; // Clear any previous error messages
    notifyListeners(); // Notify listeners about state change

    try {
      _weather = await _weatherService.fetchWeather(city); // Call weather service to fetch data
      _saveLastSearchedCity(city); // Save last searched city to SharedPreferences
    } catch (e) {
      _errorMessage = handleError(e); // Handle any errors during fetch and set error message
    } finally {
      _isLoading = false; // Set loading state to false
      notifyListeners(); // Notify listeners about state change
    }
  }

  /// Saves the last searched city to SharedPreferences for persistence
  Future<void> _saveLastSearchedCity(String city) async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); // Get instance of SharedPreferences
    prefs.setString('last_searched_city', city); // Save the city name to SharedPreferences
  }

  /// Loads the last searched city from SharedPreferences and fetches its weather data
  Future<void> loadLastSearchedCity() async {
    SharedPreferences prefs = await SharedPreferences.getInstance(); // Get instance of SharedPreferences
    String? city = prefs.getString('last_searched_city'); // Get the last searched city from SharedPreferences
    if (city != null) {
      fetchWeather(city); // Fetch weather data for the last searched city
    }
  }
}
