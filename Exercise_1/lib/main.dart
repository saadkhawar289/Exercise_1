import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gmaps/Screens/Splash.dart';

import 'Screens/Map.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Exercise-2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),

    home: Splash(),
    );

  }
}


