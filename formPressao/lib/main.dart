import 'package:flutter/material.dart';

import 'pages/bottomNavBar.dart';
//import 'pages/home.dart';

void main() => runApp(App());

 class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
    );
  }
}