//screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/providers/weather_provider.dart';
import 'package:weather_app/screens/weather_details_screen.dart';
import 'package:weather_app/widgets/animated_loading_indicator.dart';
import 'package:weather_app/widgets/search_card.dart';

/// HomeScreen class represents the main screen of the weather app.
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

/// State class for HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  // TextEditingController to manage the text input in the search field
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Retrieve screen size
    var screenSize = MediaQuery.of(context).size;
    // Check if the device is a tablet based on screen width
    var isTablet = screenSize.width > 600;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Weather App',
          style: Theme.of(context).textTheme.headlineLarge!,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF6200EA), Color(0xFF03DAC6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          // Build layout based on orientation
          if (orientation == Orientation.portrait) {
            return _buildPortraitMode(isTablet);
          } else {
            return _buildLandscapeMode(isTablet);
          }
        },
      ),
    );
  }

  /// Builds the UI for portrait mode.
  Widget _buildPortraitMode(bool isTablet) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 64.0 : 16.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Search Card Widget
          SearchCard(
            controller: _controller,
            onSearchPressed: () => _onSearchPressed(context),
          ),
          const SizedBox(height: 16),
          // Animated Loading Indicator Widget
          const AnimatedLoadingIndicator(),
        ],
      ),
    );
  }

  /// Builds the UI for landscape mode.
  Widget _buildLandscapeMode(bool isTablet) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 128.0 : 32.0, vertical: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                // Search Card Widget
                SearchCard(
                  controller: _controller,
                  onSearchPressed: () => _onSearchPressed(context),
                ),
                const SizedBox(height: 16),
                // Animated Loading Indicator Widget
                const AnimatedLoadingIndicator(),
              ],
            ),
          ),
          const SizedBox(width: 24)
        ],
      ),
    );
  }

  /// Handles search button press, initiates weather data fetch and handles navigation and errors.
  void _onSearchPressed(BuildContext context) {
    // Check if the search field is not empty
    if (_controller.text.trim().isNotEmpty) {
      // Fetch weather data for the entered city
      Provider.of<WeatherProvider>(context, listen: false)
          .fetchWeather(_controller.text.trim())
          .then((_) {
        // Check for errors after fetching data
        if (Provider.of<WeatherProvider>(context, listen: false).errorMessage == null) {
          // Navigate to WeatherDetailsScreen if no error
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const WeatherDetailsScreen()),
          );
        } else {
          // Show error message in a SnackBar if there is an error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Row(
                children: [
                  const Icon(Icons.error, color: Color(0xFFBDBDBD)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      Provider.of<WeatherProvider>(context, listen: false).errorMessage!,
                      style: Theme.of(context).textTheme.headlineSmall!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      }).catchError((error) {
        // Show error message in a SnackBar if fetching data fails
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Failed to fetch weather data. Please try again.',
              style: Theme.of(context).textTheme.headlineSmall!,
            ),
          ),
        );
      });
    } else {
      // Show warning message if the search field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              const Icon(Icons.warning, color: Color(0xFFBDBDBD)),
              const SizedBox(width: 8),
              Text(
                'Please enter a city name.',
                style: Theme.of(context).textTheme.headlineSmall!,
              ),
            ],
          ),
        ),
      );
    }
  }
}
