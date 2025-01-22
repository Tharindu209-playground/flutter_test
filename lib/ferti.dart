import 'package:flutter/material.dart';

class ferti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          title: Text('පොහොර යෙදීම'),
          backgroundColor: Color.fromARGB(190, 84, 168, 78),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Image.asset(
                    'assets/8.jpg',
                    width: 600,
                    height: 700,
                  ),
                  SizedBox(height: 35),
                  Image.asset(
                    'assets/11.jpg',
                    width: 600,
                    height: 700,
                  ),
                  SizedBox(height: 35),
                  Image.asset(
                    'assets/10.jpg',
                    width: 600,
                    height: 700,
                  ),
                  SizedBox(height: 35),
                  Image.asset(
                    'assets/9.jpg',
                    width: 600,
                    height: 750,
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
