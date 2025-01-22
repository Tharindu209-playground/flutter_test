import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class view_new extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<view_new> {
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
      final Object temp = event.snapshot.value ?? 0;
      setState(() {
        _tempController = temp.toString();
      });
    });
    _database.child('humidity').onValue.listen((event) {
      final Object humi = event.snapshot.value ?? 0;
      setState(() {
        humidity = humi.toString();
      });
    });
    _database.child('selection').onValue.listen((event) {
      final Object sele = event.snapshot.value ?? 0;
      setState(() {
        selection = sele.toString();
        if (selection == '1') {
          name = 'Tomato';
        } else if (selection == '2') {
          name = 'Cucumber';
        } else if (selection == '3') {
          name = 'Bell Pepper';
        } else if (selection == '4') {
          name = 'Capsicum';
        } else if (selection == '5') {
          name = 'Scotch Bonnet';
        } else if (selection == '6') {
          name = 'Chilli';
        } else {
          name = 'Manual';
        }
      });
    });
  }

  Future<void> _initializeFirebase() async {
    await Firebase.initializeApp();
    _readData();
  }

  void _readData() {
    _database.child('humidity').once().then((DatabaseEvent snapshot) {
      print('Data: ${snapshot.snapshot.value}');
    });
  }

  void _writeData(String x, int y) {
    _database.child(x).set(y).then((_) {
      print('mtemp updated successfully');
    }).catchError((error) {
      print('Failed to update mtemp: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD8EED3),
      body: Column(
        children: [
          // Top image and logo section
          Container(
            padding: EdgeInsets.all(16.0),
            color: Color(0xFFD8EED3),
            child: Column(
              children: [
                SizedBox(height: 40),
                Image.asset(
                  'assets/farmer.jpg', // Replace with your image asset path
                  height: 300,
                  width: 450,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          SizedBox(height: 0),
          // Tomato information and controls section
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFF113810),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tomato title
                  Text(
                    ' Farm Conditions',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 29,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),

                  // Temperature and Humidity Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatusItem(
                        icon: Icons.thermostat,
                        label: 'Temperature',
                        value: _tempController + '°C',
                      ),
                      _buildStatusItem(
                        icon: Icons.water_drop,
                        label: 'Humidity',
                        value: humidity + '%',
                      ),
                    ],
                  ),
                  SizedBox(height: 20),

                  const Text(
                    'Cultivation:',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70,
                      letterSpacing: 0,
                      fontFamily: 'Roboto',
                    ),
                  ),
                  Text(
                    name, // Display temperature as text
                    style: const TextStyle(
                      fontSize: 50,
                      color: Color.fromARGB(255, 255, 255, 255),
                      letterSpacing: 0,
                    ),
                  ),
                  SizedBox(height: 35),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(320, 48),
                        backgroundColor: Color.fromARGB(129, 143, 239, 136),
                      ),
                      onPressed: () {
                        _writeData('get_temp&hum', int.parse('1'));
                      },
                      child: const Text(
                        'Temperature & Humidity',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 255, 255, 255),
                          letterSpacing: 0,
                          fontFamily: 'Roboto',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method for Temperature and Humidity status items
  Widget _buildStatusItem(
      {required IconData icon, required String label, required String value}) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: Color(0xFFA7CDB9),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: Color(0xFF2C6E49), size: 36),
        ),
        SizedBox(height: 8),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white70,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  // Helper method for system status rows
  Widget _buildSystemStatusRow(String label, String status, Color statusColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          Text(
            status,
            style: TextStyle(
              color: statusColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
