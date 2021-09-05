import 'package:flutter/material.dart';
import 'package:shortly/src/screens/view/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shortly',
      home: ShortlyHomePage(),
    );
  }
}
