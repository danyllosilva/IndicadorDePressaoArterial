import 'package:flutter/material.dart';

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Sobre nós'),
      ),
      body: Center(
        child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('data')
        ],
        )
      )
    );
  }
}