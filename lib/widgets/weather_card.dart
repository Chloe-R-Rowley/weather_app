//widgets/weather_card.dart

import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/weather_info_card.dart';

/// A widget that displays detailed weather information in a card format.
class WeatherCard extends StatelessWidget {
  final Weather weather;

  // Constructor to initialize the Weather object.
  const WeatherCard({
    super.key,
    required this.weather,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        // Card widget with elevation and rounded corners.
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          // Padding around the card content.
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Display city name.
              Text(
                weather.cityName,
                style: Theme.of(context).textTheme.titleLarge!,
              ),
              const SizedBox(height: 4),
              Text(
                "City Name",
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
              const SizedBox(height: 18),
              // Display weather icon.
              Image.network(
                'https://openweathermap.org/img/w/${weather.icon}.png',
                scale: 0.8,
              ),
              const SizedBox(height: 18),
              // Display temperature.
              Text(
                '${weather.temperature}°C',
                style: Theme.of(context).textTheme.titleMedium!,
              ),
              const SizedBox(height: 4),
              Text(
                "Temperature",
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
              const SizedBox(height: 24),
              // Display weather description.
              Text(
                weather.description,
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                "Weather Description",
                style: Theme.of(context).textTheme.bodyMedium!,
              ),
              const SizedBox(height: 24),
              // Display additional weather info (humidity and wind speed).
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Display humidity.
                  WeatherInfoCard(
                    icon: Icons.water,
                    value: '${weather.humidity}%',
                    label: 'Humidity',
                  ),
                  // Display wind speed.
                  WeatherInfoCard(
                    icon: Icons.air,
                    value: '${weather.windSpeed} m/s',
                    label: 'Wind',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
