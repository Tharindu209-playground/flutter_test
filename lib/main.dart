import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_agro/drip.dart';
import 'package:smart_agro/enargy.dart';
import 'package:smart_agro/exhust.dart';
import 'package:smart_agro/ferti.dart';
import 'package:smart_agro/firebase_options.dart';
import 'package:smart_agro/light.dart';
import 'package:smart_agro/manu.dart';
import 'package:smart_agro/manual.dart';
import 'package:smart_agro/mist.dart';
import 'package:smart_agro/selection.dart';
import 'package:smart_agro/view.dart';
import 'package:smart_agro/view_details.dart';
import 'package:smart_agro/view_new.dart';
import 'package:smart_agro/welcome.dart';

import 'home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/we': (context) => welcome(),
        '/': (context) => HomePage(),
        '/view': (context) => ViewPage(
            selection: ModalRoute.of(context)!.settings.arguments as String),
        '/manual': (context) => manual(
            selection: ModalRoute.of(context)!.settings.arguments as String),
        '/viewDetails': (context) => ViewDetails(),
        '/en': (context) => enargy(),
        '/fe': (context) => ferti(),
        '/se': (context) => const Selection(),
        '/manu': (context) => manu(),
        '/drip': (context) => drip(),
        '/view_2': (context) => drip(),
        '/view_new': (context) => view_new(),
        '/mist': (context) => mist(),
        '/exhaust': (context) => Exhaust(),
        '/light': (context) => light(),
      },
      initialRoute: '/we',
    );
  }
}
