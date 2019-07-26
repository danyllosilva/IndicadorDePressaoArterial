import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:link/link.dart';

//import 'drawerMenu.dart';

class SobrePage extends StatelessWidget {
  
  //DrawerMenu drawer = new DrawerMenu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Sobre Nós'),
      ),
      //drawer: drawer,
      body: Center(
        child: Column(
        //mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text('A campanha “Eu Sou 12 por 8” foi desenvolvida pelo Departamento de Hipertensão Arterial da Sociedade Brasileira de Cardiologia' 
                  'para ajudar os brasileiros a viverem mais e com muito mais saúde.' 
                  'Vista essa camisa e entre para nossa seleção: meça sua pressão arterial, faça exercícios físicos, controle o peso,' 
                  'a alimentação, visite seu médico periodicamente e ajude a divulgar essa campanha.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 15),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Text('Conheça os criadores do app',style: TextStyle(fontSize: 18)),
          ),
          Padding(
            padding: const EdgeInsets.all(7),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: 'danyllo',
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => DanylloHero())),
                    child: Image.asset('assets/images/danyllo.jpg', height: 150)
                  )
                ),Padding(
                  padding: const EdgeInsets.all(4),
                  child: Text('Danyllo Carlos',style: TextStyle(fontSize: 22)),
                )
              ],
            ),
          ),
          
          
          Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: 'luan',
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => LuanHero())),
                    child: Image.asset('assets/images/luan.jpg')
                  )
                ),Text('Luan Carlos',style: TextStyle(fontSize: 22))
              ],
            ),
          ),
          
        ],
        )
      )
    );
  }
}

class DanylloHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Danyllo Carlos'),
      ),
      body: Center(
        child: Column(mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Hero(
              tag: 'danyllo',
              child: Image.asset('assets/images/danyllo.jpg', height: 200)
            ),
            Text('\nUndegraduate student of Information Systems at'
                  'Federal Institute of Education, Science and Technology of Maranhão, São Luís, Brazil.\n\n',
                  textAlign: TextAlign.center,
            ),
            Icon(MdiIcons.mapMarker),
            Text('São Luís - MA - Brazil\n'),
            Icon(MdiIcons.email),
            Text('danyllo.rsilva@gmail.com\n'),
            Icon(MdiIcons.link),
            Link(
              child: Text('http://lattes.cnpq.br/8066745755477050'),
              url: 'http://lattes.cnpq.br/8066745755477050'
            )
          ],
        ),
      ),
    );
  }
}

class LuanHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Luan Carlos'),
      ),
      body: Center(
        child:Column(
        mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Hero(
              tag: 'luan',
              child: Image.asset('assets/images/luan.jpg')
            ),
            Text('Graduando em Sistemas de Informação - IFMA\n' 
                  'Técnico em Informática\n',
                  textAlign: TextAlign.center
            ),
            Icon(MdiIcons.mapMarker),
            Text('São Luís - MA - Brazil\n'),
            Icon(MdiIcons.email),
            Text('luancmjesus@gmail.com\n\n\n\n'),
          ],
        ),
      ),
    );
  }
}