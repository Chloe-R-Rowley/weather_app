//widgets/animated_loading_indicator.dart

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';

/// A widget that displays an animated loading indicator based on the loading state
/// of the WeatherProvider.
class AnimatedLoadingIndicator extends StatelessWidget {
  const AnimatedLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      // Consumer widget listens to changes in WeatherProvider.
      builder: (context, weatherProvider, child) {
        return AnimatedSwitcher(
          // AnimatedSwitcher provides a smooth transition between widgets.
          duration: const Duration(milliseconds: 300),
          child: weatherProvider.isLoading
              ? Center(
                  // Display a Lottie animation when the weatherProvider is in a loading state.
                  child: Lottie.asset(
                    'assets/animations/loading.json',
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  ),
                )
              : const SizedBox.shrink(), // Display an empty box when not loading.
        );
      },
    );
  }
}
