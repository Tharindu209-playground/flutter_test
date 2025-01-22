import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class mist extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<mist> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  String _tempController = "";
  String humidity = "";
  String selection = '';
  String name = '';
  final TextEditingController _mtempController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initializeFirebase();
    _database.child('temp').onValue.listen((event) {
      setState(() {});
    });
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
  }

  void _writeData(String x, String y) {
    _database.child(x).set(y).then((_) {
      print('mtemp updated successfully');
    }).catchError((error) {
      print('Failed to update mtemp: $error');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/mist_irri.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Spacer(), // Pushes content to the bottom
                // Buttons
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(180, 52),
                          backgroundColor: Color(0xFF508D4E),
                        ),
                        onPressed: () {
                          _writeData('mist', 'on');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Mist Irrigation System ON !!!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: const Text(
                          'ON',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 0,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      SizedBox(height: 45),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(180, 52),
                          backgroundColor: Color(0xFFCD0505),
                        ),
                        onPressed: () {
                          _writeData('mist', 'off');

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Mist Irrigation System OFF !!!'),
                              duration: Duration(seconds: 2),
                            ),
                          );
                        },
                        child: const Text(
                          'OFF',
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 0,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
                      const Text(
                        "Cur",
                        style: TextStyle(
                          fontSize: 35,
                          color: Color.fromARGB(0, 255, 255, 255),
                          fontFamily: 'Kavoon',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25), // Space at the bottom
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}
