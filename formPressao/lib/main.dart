import 'package:flutter/material.dart';
import 'pages/home.dart';

void main() => runApp(Home());

 class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}