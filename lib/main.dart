// @dart=2.9
import 'package:flutter/material.dart';
import 'package:foot_app/pages/Home_Page.dart';

import 'pages/Starter_Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(fontFamily: 'Roboto'),
      home: StarterPage(),
    );
  }
}
