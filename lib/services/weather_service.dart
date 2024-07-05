import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart'; // Import your weather model

class WeatherService {
  String? apiKey = dotenv.env['API_KEY']; // Replace with your OpenWeatherMap API key

  // Function to check internet connectivity using the connectivity package
  Future<bool> checkInternetConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;
  }

  // Function to fetch weather data for a given city
  Future<Weather> fetchWeather(String cityName) async {
    try {
      // Check internet connectivity before making the API request
      if (await checkInternetConnectivity()) {
        var url =
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric';
        var response = await http.get(Uri.parse(url));

        // If the API request is successful (status code 200)
        if (response.statusCode == 200) {
          var jsonData = jsonDecode(response.body);
          // Parse weather data and return a Weather object
          return Weather.fromJson(jsonData);
        } else {
          // Handle API errors (non-200 status codes)
          throw Exception('Failed to fetch weather');
        }
      } else {
        // Handle no internet connectivity
        throw Exception('No internet connection');
      }
    } catch (exception) {
      // Handle exceptions during API call (e.g., network errors, parsing errors)
      throw Exception('Error: $exception');
    }
  }
}
