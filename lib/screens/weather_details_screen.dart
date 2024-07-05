//screens/weather_details_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/widgets/weather_card.dart';

/// WeatherDetailsScreen class represents the screen that displays weather details.
class WeatherDetailsScreen extends StatelessWidget {
  const WeatherDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the weather provider and the weather data
    var weatherProvider = Provider.of<WeatherProvider>(context);
    var weather = weatherProvider.weather;

    return Scaffold(
      // Display different UI based on whether weather data is available
      body: weather == null
          ? Center(
              child: Text(
                'No weather data available.',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            )
          : Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF6200EA), Color(0xFF03DAC6)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: WeatherCard(weather: weather),
                ),
              ),
            ),
      // Floating action button to refresh weather data
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Fetch weather data for the current city
          Provider.of<WeatherProvider>(context, listen: false).fetchWeather(weather!.cityName);
        },
        child: const Icon(Icons.refresh),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
