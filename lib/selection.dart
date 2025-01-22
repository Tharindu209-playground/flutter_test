import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class Selection extends StatefulWidget {
  const Selection({super.key});

  @override
  SelectionState createState() => SelectionState();
}

class SelectionState extends State<Selection> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  String mode = "";

  @override
  void initState() {
    super.initState();
    _initializeFirebase();

    _database.child('mode').onValue.listen((event) {
      final Object smode = event.snapshot.value ?? 0;
      setState(() {
        mode = smode.toString();
      });
    });
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  void _writeData(String key, String value) {
    _database.child(key).set(value).catchError((error) {
      // Handle error here if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6EFD8), // Light green background color
      body: Stack(
        children: [
          Center(
            child: Container(
              width: 800, // Set the desired width
              height: 800, // Set the desired height
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Mode Selection",
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 54, 112, 53),
                      fontFamily: 'Kavoon',
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    decoration: BoxDecoration(
                      color: Color(0xFF113810), // Darker green for current mode
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Column(
                      children: [
                        const Text(
                          "Current mode",
                          style: TextStyle(
                            fontSize: 34,
                            color: Colors.white,
                            fontFamily: 'Kavoon',
                          ),
                        ),
                        Text(
                          mode.isEmpty ? "Off" : mode,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 80),
                  // Auto Button
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _writeData('mode', 'Auto');
                        Navigator.pushNamed(context, '/');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF508D4E), // Light green color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Auto',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Kavoon',
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  // Manual Button
                  SizedBox(
                    width: 200,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        _writeData('mode', 'Manual');
                        Navigator.pushNamed(context, '/manu');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF508D4E), // Light green color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'Manual',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Kavoon',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Developer Text at the Bottom Right
          Positioned(
            bottom: 10,
            right: 20,
            child: Text(
              "Developer: Damsara Wishwajith",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
                fontFamily: 'Roboto',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
