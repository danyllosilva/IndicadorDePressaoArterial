import 'package:flutter/material.dart';

import 'pages/home.dart';

void main() => runApp(IndPress());

 class IndPress extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}