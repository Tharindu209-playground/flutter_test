import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_agro/view_2.dart';

class manu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFD8EED3),
          statusBarBrightness: Brightness.dark,
        ),
        title: const Text(
          'Smart Agro',
          style: TextStyle(
            fontSize: 30,
            color: Color.fromARGB(255, 5, 98, 48),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color(0xFFD8EED3),
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bgas.jpg'), // Background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Spacer(),
                SizedBox(height: 20),
                // Second Row of Items
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildItem(context, '', 'assets/drip.jpg', '3'),
                    _buildItem(context, '', 'assets/mist.jpg', '4'),
                  ],
                ),
                SizedBox(height: 20),
                // Third Row of Items
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildItem(context, '', 'assets/ex.jpg', '5'),
                    _buildItem(context, '', 'assets/light.jpg', '6'),
                  ],
                ),
                SizedBox(height: 20),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(320, 48),
                    backgroundColor: Color.fromARGB(129, 143, 239, 136),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              view_2()), // Ensure View2 class is properly defined
                    );
                  },
                  child: const Text(
                    'View',
                    style: TextStyle(
                      fontSize: 28,
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
                    fontSize: 25,
                    color: Color.fromARGB(0, 255, 255, 255),
                    fontFamily: 'Kavoon',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }

  Widget _buildItem(
      BuildContext context, String label, String imagePath, String selection) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 1, // Possibly unused, set to desired size or remove
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Roboto',
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(100, 90),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            if (selection == '3') {
              Navigator.pushNamed(context, '/drip');
            } else if (selection == '4') {
              Navigator.pushNamed(context, '/mist');
            } else if (selection == '5') {
              Navigator.pushNamed(context, '/exhaust');
            } else if (selection == '6') {
              Navigator.pushNamed(context, '/light');
            }
          },
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 150,
            height: 130,
          ),
        ),
      ],
    );
  }
}
