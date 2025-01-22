// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Smart Medicine Box',
            style: TextStyle(
              fontSize: 38, // Set the text size
              fontWeight: FontWeight.bold, // Set the font weight
              color: Color.fromARGB(255, 8, 249, 249), // Set the text color
              letterSpacing: 2.0, // Set the letter spacing
              fontStyle: FontStyle.italic, // Set the font style to italic
              fontFamily: 'Roboto', // Set the font family),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: 400, // Set the width
            height: 300, // Set the height
            child: Image.asset(
              'assets/qd.jpg',
              fit: BoxFit.cover, // Adjust the fit as needed
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              // Navigate to second screen
              Navigator.pushNamed(context, '/second');
            },
            child: const Text(
              'ENTER',
              style: TextStyle(
                fontSize: 38, // Set the text size
                fontWeight: FontWeight.bold, // Set the font weight
                color: Color.fromARGB(255, 0, 0, 0), // Set the text color
                letterSpacing: 2.0, // Set the letter spacing
                fontStyle: FontStyle.italic, // Set the font style to italic
                fontFamily: 'Roboto', // Set the font family),
              ),
            ),
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor:
                  const Color.fromARGB(255, 245, 135, 17), // Set the text color
              padding: const EdgeInsets.symmetric(
                  horizontal: 20, vertical: 10), // Set the padding
              textStyle: const TextStyle(fontSize: 18), // Set the text size
            ),
          ),
        ],
      ),
    );
  }
}
