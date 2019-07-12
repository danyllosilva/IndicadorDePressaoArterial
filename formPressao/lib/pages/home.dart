import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'sobre.dart';
import 'tiposPressao.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> listaTela = new List();
  CarouselSlider instancia;

  @override
  void initState(){
    super.initState();

    listaTela.add(info1());
    listaTela.add(info2());
    listaTela.add(info3());
  }

  @override
  Widget build(BuildContext context) {

    instancia = CarouselSlider(
      autoPlay: true,
      autoPlayAnimationDuration: Duration(seconds: 3),
      items: listaTela.map(
        (it){
          return Container(
            width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: Colors.black12
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                it
              ],
            ),
          );
        }
      ).toList(),
      height: MediaQuery.of(context).size.height-150,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Avaliador de pressão'),
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            instancia 
          ],
        )
      ),
    );
  }
}

info1(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
        Text('Informações do App',)
    ],
  );
}

info2(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
        Text('Informações do App - 2')
    ],
  );
}

info3(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
        Text('Informações do App - 3')
    ],
  );
}