import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_agro/manual.dart';
import 'package:smart_agro/view.dart';
import 'package:smart_agro/view_new.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Color(0xFFD8EED3),
          statusBarBrightness: Brightness.dark,
        ),
        actions: [
          PopupMenuButton<int>(
            icon: const Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 0, 0, 0),
              size: 30,
            ),
            onSelected: (value) {
              switch (value) {
                case 0:
                  Navigator.pushNamed(context, '/en');
                  break;
                case 1:
                  Navigator.pushNamed(context, '/fe');
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem<int>(
                value: 0,
                child: Text('Nutritional deficiency'),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Text('Fertilizer applications'),
              ),
            ],
          ),
        ],
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
                image: AssetImage('assets/sa.jpg'), // Background image path
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                const Spacer(),
                // Invisible text for spacing

                SizedBox(height: 15),
                // First Row of Items
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildItem(context, '', 'assets/tom.jpg', '1'),
                    _buildItem(context, '', 'assets/cucumber.jpg', '2'),
                  ],
                ),
                SizedBox(height: 15),
                // Second Row of Items
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildItem(context, '', 'assets/bell.jpg', '3'),
                    _buildItem(context, '', 'assets/muriya.jpg', '4'),
                  ],
                ),
                SizedBox(height: 15),
                // Third Row of Items
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildItem(context, '', 'assets/nai.jpg', '5'),
                    _buildItem(context, '', 'assets/chili.jpg', '6'),
                  ],
                ),
                SizedBox(height: 35),
                // Action Buttons
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(320, 48),
                    backgroundColor: Color.fromARGB(129, 143, 239, 136),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => manual(selection: '7'),
                      ),
                    );
                  },
                  child: const Text(
                    'Manual',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(320, 48),
                    backgroundColor: Color.fromARGB(129, 143, 239, 136),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => view_new()),
                    );
                  },
                  child: const Text(
                    'View',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
                const Text(
                  "Cur",
                  style: TextStyle(
                    fontSize: 15,
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
            fontSize: 1,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
            fontFamily: 'Roboto',
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: Size(150, 90),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ViewPage(selection: selection),
              ),
            );
          },
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            width: 145,
            height: 90,
          ),
        ),
      ],
    );
  }
}
