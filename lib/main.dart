import 'package:flutter/material.dart';
import 'package:fluttertutorialcoachmark/my_tutorial_coach_mark_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTutorialCoachMarkScreen(),
    );
  }
}
