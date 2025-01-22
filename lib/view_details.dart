import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ViewDetails extends StatefulWidget {
  @override
  _ViewDetailsState createState() => _ViewDetailsState();
}

class _ViewDetailsState extends State<ViewDetails> {
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
        }
        else if (selection == '2') {
          name = 'Cucumber';
        }
        else if (selection == '3') {
          name = 'Bell Pepper';
        }
        else if (selection == '4') {
          name = 'Capsicum';
        }
        else if (selection == '5') {
          name = 'Scotch Bonnet';
        }
        else if (selection == '6') {
          name = 'Chilli';
        }
        else {
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

  void _writeData() {
    final int mtemp = int.tryParse(_mtempController.text) ?? 0;
    _database.child('mtemp').set(mtemp).then((_) {
      print('mtemp updated successfully');
    }).catchError((error) {
      print('Failed to update mtemp: $error');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Plant Information'),
        backgroundColor: Color.fromARGB(190, 84, 168, 78),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center the content horizontally
            children: [
              const Text(
                'Temperature:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 8),
              Text(
                _tempController, // Display temperature as text
                style: const TextStyle(
                  fontSize: 50,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 25),
              const Text(
                'Humidity:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 8),
              Text(
                humidity, // Display temperature as text
                style: const TextStyle(
                  fontSize: 50,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 25),
              const Text(
                'Cultivation:',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 15),
              Text(
                name, // Display temperature as text
                style: const TextStyle(
                  fontSize: 50,
                  color: Color.fromARGB(255, 0, 0, 0),
                  letterSpacing: 0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }
}
