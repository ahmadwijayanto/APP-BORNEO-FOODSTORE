import 'package:borneo_foodstore/screens/home_sample/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:borneo_foodstore/screens/home_sample/home_screen.dart';
import 'package:borneo_foodstore/utils/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Borneo Foodstore',
      theme: theme(),
      home: HomePage(),
    );
  }
}
