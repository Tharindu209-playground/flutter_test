import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart_agro/home_page.dart';

class manual extends StatefulWidget {
  final String selection;
  const manual({Key? key, required this.selection}) : super(key: key);
  @override
  mn createState() => mn();
}

class mn extends State<manual> {
  final DatabaseReference _database = FirebaseDatabase.instance.ref();
  final TextEditingController _tempController = TextEditingController();
  final TextEditingController days = TextEditingController();
  final TextEditingController plants = TextEditingController();
  final TextEditingController plant1_100ml_time = TextEditingController();
  final TextEditingController plant1_water_ml = TextEditingController();

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
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('Manual Plant Information'),
        backgroundColor: Color.fromARGB(190, 84, 168, 78),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'උෂ්ණත්වය සකසන්න',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(206, 12, 50, 9),
                  letterSpacing: 0.0,
                  fontFamily: 'Roboto',
                ),
              ),
              const Text(
                'Select Temparature',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(205, 14, 60, 11),
                  letterSpacing: 0.0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _tempController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(150.0),
                  ),
                  hintText: 'Enter controll temperature',
                  hintStyle: TextStyle(color: Color.fromARGB(180, 18, 60, 15)),
                ),
                style: TextStyle(color: Color.fromARGB(180, 18, 60, 15)),
              ),
              SizedBox(height: 21),
              const Text(
                'ස්තාපිත දිනය',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(206, 12, 50, 9),
                  letterSpacing: 0.0,
                  fontFamily: 'Roboto',
                ),
              ),
              const Text(
                '(Planted Day)',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(205, 14, 60, 11),
                  letterSpacing: 0.0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: days,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(150.0),
                  ),
                  hintText: 'Enter planted day',
                  hintStyle: TextStyle(color: Color.fromARGB(180, 18, 60, 15)),
                ),
                style: TextStyle(color: Color.fromARGB(180, 18, 60, 15)),
              ),
              SizedBox(height: 25),
              const Text(
                'වගාවේ පැළ ගනන',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(206, 12, 50, 9),
                  letterSpacing: 0.0,
                  fontFamily: 'Roboto',
                ),
              ),
              const Text(
                '(How Many Plants)',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(205, 14, 60, 11),
                  letterSpacing: 0.0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: plants,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(150.0),
                  ),
                  hintText: 'Enter number of plants',
                  hintStyle: TextStyle(color: Color.fromARGB(180, 18, 60, 15)),
                ),
                style: TextStyle(color: Color.fromARGB(180, 18, 60, 15)),
              ),
              SizedBox(height: 25),
              const Text(
                'එක් පැළයකට අවශ්‍ය ජලය(මි.ලි)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(206, 12, 50, 9),
                  letterSpacing: 0.0,
                  fontFamily: 'Roboto',
                ),
              ),
              const Text(
                '(One Plant Want Water (ml))',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(205, 14, 60, 11),
                  letterSpacing: 0.0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: plant1_water_ml,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(150.0),
                  ),
                  hintText: 'Enter watering frequency',
                  hintStyle: TextStyle(color: Color.fromARGB(180, 18, 60, 15)),
                ),
                style: TextStyle(color: Color.fromARGB(180, 18, 60, 15)),
              ),
              SizedBox(height: 25),
              const Text(
                'එක් පැළයකට ජලය 100ml යෙදීමට ගතවන කාලය(තත්පර)',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(206, 12, 50, 9),
                  letterSpacing: 0.0,
                  fontFamily: 'Roboto',
                ),
              ),
              const Text(
                '(Time taken to apply 100ml of water per plant (Seconds))',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(205, 14, 60, 11),
                  letterSpacing: 0.0,
                  fontFamily: 'Roboto',
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: plant1_100ml_time,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 255, 255, 255),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(150.0),
                  ),
                  hintText: 'Enter time',
                  hintStyle: TextStyle(color: Color.fromARGB(180, 18, 60, 15)),
                ),
                style: TextStyle(color: Color.fromARGB(180, 18, 60, 15)),
              ),
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      _writeData('selection', int.parse(widget.selection));
                      _writeData('mtemp', int.parse(_tempController.text));
                      _writeData('days', int.parse(days.text));
                      _writeData('plants', int.parse(plants.text));
                      _writeData(
                          'plant1_water_ml', int.parse(plant1_water_ml.text));
                      _writeData('plant1_100ml_time',
                          int.parse(plant1_100ml_time.text));
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Your details saved successfully!'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(161, 158, 241, 119),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
