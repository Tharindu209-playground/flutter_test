import 'package:flutter/material.dart';

class enargy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text('පෝෂණ ඌණතා'),
          backgroundColor:Color.fromARGB(190, 84, 168, 78),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Image.asset(
                    'assets/1.jpg',
                    width: 600,
                    height: 550,
                  ),
                  SizedBox(height: 35),
                  Image.asset(
                    'assets/2.jpg',
                    width: 600,
                    height: 550,
                  ),
                  SizedBox(height: 35),
                  Image.asset(
                    'assets/3.jpg',
                    width: 600,
                    height: 550,
                  ),
                  SizedBox(height: 35),
                  Image.asset(
                    'assets/4.jpg',
                    width: 600,
                    height: 550,
                  ),
                  SizedBox(height: 35),
                  Image.asset(
                    'assets/5.jpg',
                    width: 600,
                    height: 550,
                  ),
                  SizedBox(height: 35),
                  Image.asset(
                    'assets/6.jpg',
                    width: 600,
                    height: 550,
                  ),
                  SizedBox(height: 35),
                  Image.asset(
                    'assets/7.jpg',
                    width: 600,
                    height: 550,
                  ),
                  SizedBox(height: 35),
                  const Padding(
                    padding: EdgeInsets.all(0.0),
                    child: BottomAppBar(
                      // alignment: Alignment.bottomCenter,
                      child: Text(
                        'සැ.යු :-\nමෙය කෘෂිකර්මාන්ත දෙපාර්තමේන්තුව මගින් නිකුත් කල ආරක්ශිත ගෘහ තුල බෝගවගාවට අතවැලක් පොත මගින් උපුටාගන්නා ලදී ',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 0, 0),
                            fontSize: 10),
                      ),
                    ),
                  )
                ]))));
  }
}
