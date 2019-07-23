import 'package:flutter/material.dart';

import 'home.dart';
import 'tiposPressao.dart';

class SobrePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Sobre nós'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Página Inicial'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
              },
            ),
            ListTile(
              title: Text('Tipos de Pressão'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TiposPressaoTabBar()));
              },
            ),
            Divider(
              height: 0.5,
            ),
            ListTile(
              title: Text('Sobre nós'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SobrePage()));
              },
            )
          ],
        ),
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