//widgets/weather_error_handler.dart

import 'dart:io';

// Define custom exception classes for different error scenarios
class NetworkException implements Exception {}
class ServerException implements Exception {}
class DataFormatException implements Exception {}
class UnknownException implements Exception {}

// Handle different error types and return appropriate error message
String handleError(dynamic error) {
  // Check the type of error and return corresponding error message
  if (error is SocketException) {
    return 'Please check your internet connection and try again.';
  } else if (error is HttpException) {
    return 'Failed to fetch weather data. Please try again later.';
  } else if (error is FormatException) {
    return 'Invalid response from server. Please try again later.';
  } else if (error is NetworkException) {
    return 'Network issue occurred. Please check your connection.';
  } else if (error is ServerException) {
    return 'Server error occurred. Please try again later.';
  } else if (error is DataFormatException) {
    return 'Data format error occurred. Please try again later.';
  } else {
    return 'Unexpected error occurred. Please try again later.';
  }
}

