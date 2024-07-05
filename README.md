# Flutter Weather App

This Flutter app fetches current weather information for a specified city using the OpenWeatherMap API. It consists of two screens: a home screen with a city search feature and a weather details screen displaying the weather conditions.

## Features

- Search for weather by city name
- Display current weather details including temperature, weather condition, humidity, and wind speed
- Error handling for API requests
- Responsive design for mobile and tablet devices
- Data persistence to remember the last searched city
- Refresh button to update weather information

## Requirements

- Flutter SDK installed ([installation guide](https://flutter.dev/docs/get-started/install))
- Code editor (e.g., VS Code, Android Studio)
- OpenWeatherMap API key ([sign up](https://home.openweathermap.org/users/sign_up))

## Getting Started

1. **Clone the repository:**

   git clone <repository-url>

   cd flutter_weather_app

2. **Add OpenWeatherMap API Key:**

   Obtain your API key from OpenWeatherMap and add it to lib/services/weather_service.dart:

   "const String apiKey = 'YOUR_API_KEY_HERE';"

3. **Run the app:**

   Connect your device/emulator and run the following command:

   ''flutter run''

   The app should build and launch on your device/emulator.

You can look at the screenshots and video here:

[Open this folder](images-videos/)

This `README.md` file serves as a guide for users and contributors to understand, set up, and use your Flutter weather app effectively. Adjust it based on your specific app features and requirements.