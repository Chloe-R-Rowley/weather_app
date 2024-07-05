//widgets/search_card.dart

import 'package:flutter/material.dart';

/// A widget that displays a search card with a text field and a search button.
class SearchCard extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearchPressed;

  // Constructor to initialize controller and onSearchPressed callback.
  const SearchCard({
    super.key,
    required this.controller,
    required this.onSearchPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      // Card widget with elevation and rounded corners.
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        // Padding around the card content.
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Text field for city input.
            TextFormField(
              controller: controller,
              style: Theme.of(context).textTheme.bodySmall!,
              decoration: InputDecoration(
                hintText: 'Enter city name',
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear, color: Colors.grey),
                  onPressed: () => controller.clear(), // Clear text field on icon press.
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Elevated button for submitting city search.
            ElevatedButton(
              onPressed: onSearchPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search), // Search icon.
                  const SizedBox(width: 8),
                  Text(
                    'Search',
                    style: Theme.of(context).textTheme.headlineMedium!, // Search text.
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
