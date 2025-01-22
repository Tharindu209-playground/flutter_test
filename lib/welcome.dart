import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async {
        // Close the app on back button press
        exit(0); // OR use SystemNavigator.pop() to close the app
        return false; // Return false to stop further processing
      },
      child: Scaffold(
        body: Center(
          child: Container(
            width: 900, // Set the desired width
            height: 900, // Set the desired height
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/wellcome.jpg'), // Path to your image
                fit: BoxFit.cover,
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(), // Push content to the bottom
                  EnterButton(),
                ],
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(255, 24, 69, 41),
      ),
    );
  }
}

class EnterButton extends StatelessWidget {
  const EnterButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300, // Set the desired width
      height: 50, // Set the desired height
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/se');
        },
        style: ElevatedButton.styleFrom(
          textStyle: const TextStyle(
            fontSize: 18,
            fontFamily: 'Kavoon',
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: Color(0xFF508D4E), // Background color
          foregroundColor: Color.fromARGB(255, 255, 255, 255), // Text color
        ),
        child: const Text('Get Start      - >'),
      ),
    );
  }
}
