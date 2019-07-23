import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

import 'sobre.dart';
import 'tiposPressao.dart';
import 'formIndicador.dart';

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
              color: Colors.green[200]
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
      height: MediaQuery.of(context).size.height-230,
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Avaliador de Pressão'),
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
            Divider(
              height: 0.7,
            ),
            ListTile(
              title: Text('Indicador de Pressão'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TiposPressaoTabBar()));
              },
            ),
            Divider(
              height: 0.7,
            ),ListTile(
              title: Text('Tipos de Pressão'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TiposPressaoTabBar()));
              },
            ),
            Divider(
              height: 0.7,
            ),
            ListTile(
              title: Text('Sobre Nós'),
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
            instancia,
            SizedBox(height: 40),
            RaisedButton(
              onPressed: () {
                //Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) => Indicador()));
              },
              child: Text(
                'Indicador de Pressão',
                style: TextStyle(fontSize: 20)
              ),
            )
          ],
        )
      ),
    );
  }
}

info1(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('A campanha “Eu Sou 12 por 8” foi desenvolvida pelo Departamento de Hipertensão Arterial da Sociedade Brasileira de Cardiologia para ajudar os brasileiros a viverem mais e com muito mais saúde.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16)
          ),
          Image.asset('assets/images/good-health.jpg')
        ],
    ),
  );
}

info2(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Tenha Alimentação Saudável. Receitas simples, como saladas e pratos leves, não aumentam o colesterol e são fáceis de ser preparadas em casa.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16)
        ),
        Image.asset('assets/images/alimentos-saudaveis.jpg')
      ],
    ),
  );
}

info3(){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('Pratique exercícios físicos com orientação médica. Corridas com caminhadas, fazer hidroginástica ou utilizar esteira e bibicleta ergométricas auxiliam na melhora do condicionamento físico.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16)
        ),
        Image.asset('assets/images/vida-saudavel.jpg')
      ],
    ),
  );
}