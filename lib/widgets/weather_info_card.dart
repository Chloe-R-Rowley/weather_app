//widgets/weather_info_card.dart

import 'package:flutter/material.dart';

class WeatherInfoCard extends StatelessWidget {
  final IconData icon; // Icon data for the card
  final String value; // Value to display in the card
  final String label; // Label describing the value

  const WeatherInfoCard({
    super.key,
    required this.icon,
    required this.value,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Icon widget displaying provided icon with primary color
        Icon(icon, color: Theme.of(context).primaryColor, size: 32),
        const SizedBox(height: 8), // Spacer for vertical spacing
        // Text widget displaying provided value with custom text style
        Text(
          value,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4), // Spacer for vertical spacing
        // Text widget displaying provided label with bodyMedium text style
        Text(
          label,
          style: Theme.of(context).textTheme.bodyMedium!,
        ),
      ],
    );
  }
}
