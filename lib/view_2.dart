import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class view_2 extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<view_2> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  String _tempController = "";
  String drip_irri = "";
  String drip = "";
  String humidity = "";
  String selection = '';
  String name = '';
  String drip_status = '';
  String exhust_status = "";
  String exhust = '';
  String exhu = '';
  String mist_status = "";
  String mist_irri = '';
  String mist = '';
  String light_status = "";
  String light_irri = '';
  String light = '';
  Color drip_color = Colors.blue;
  Color mist_color = Colors.blue;
  Color exhust_color = Colors.blue;
  Color light_color = Colors.blue;
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
    _database.child('drip').onValue.listen((event) {
      final Object drip = event.snapshot.value ?? 0;
      setState(() {
        drip_irri = drip.toString();
        if (drip_irri == 'on') {
          drip_status = 'ON';
          drip_color = Color(0xFF113810);
        } else if (drip_irri == 'off') {
          drip_status = 'OFF';
          drip_color = Colors.red;
        }
      });
    });
    _database.child('light').onValue.listen((event) {
      final Object light = event.snapshot.value ?? 0;
      setState(() {
        light_irri = light.toString();
        if (light_irri == 'on') {
          light_status = 'ON';
          light_color = Color(0xFF113810);
        } else if (light_irri == 'off') {
          light_status = 'OFF';
          light_color = Colors.red;
        }
      });
    });
    _database.child('mist').onValue.listen((event) {
      final Object mist = event.snapshot.value ?? 0;
      setState(() {
        mist_irri = mist.toString();
        if (mist_irri == 'on') {
          mist_status = 'ON';
          mist_color = Color(0xFF113810);
        } else if (mist_irri == 'off') {
          mist_status = 'OFF';
          mist_color = Colors.red;
        }
      });
    });
    _database.child('exhust').onValue.listen((event) {
      final Object exhust = event.snapshot.value ?? 0;
      setState(() {
        exhu = exhust.toString();
        if (exhu == 'on') {
          exhust_status = 'ON';
          exhust_color = Color(0xFF113810);
        } else if (exhu == 'off') {
          exhust_status = 'OFF';
          exhust_color = Colors.red;
        }
      });
    });
    _database.child('selection').onValue.listen((event) {
      final Object sele = event.snapshot.value ?? 0;
      setState(() {
        selection = sele.toString();
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
                SizedBox(height: 10),
                Image.asset(
                  'assets/farmer.jpg', // Replace with your image asset path
                  height: 300,
                  width: 450,
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),

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
                    'Farm Conditions',
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

                  // System Status Section
                  Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Color(0xFF84A98C),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Column(
                      children: [
                        _buildSystemStatusRow(
                            'Drip irrigation', drip_status, drip_color),
                        _buildSystemStatusRow(
                            'Mist irrigation', mist_status, mist_color),
                        _buildSystemStatusRow(
                            'Exhaust Fan', exhust_status, exhust_color),
                        _buildSystemStatusRow(
                            'Light System', light_status, light_color),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),

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
