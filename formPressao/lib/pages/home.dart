import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'drawerMenu.dart';
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

    DrawerMenu drawer = new DrawerMenu();

    instancia = CarouselSlider(
      autoPlay: true,
      autoPlayAnimationDuration: Duration(seconds: 1),
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
        title: Text('IndPress - Indicador de PA')
      ),
      drawer: drawer,
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: instancia,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: RaisedButton.icon(
                icon: Icon(MdiIcons.stethoscope),
                color: Colors.green,
                textColor: Colors.white,
                label: Text('Indicador de Pressão'),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Indicador()));
                },
              ),
            )
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
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('A campanha “Eu Sou 12 por 8” foi desenvolvida pelo Departamento de Hipertensão Arterial da' 
                'Sociedade Brasileira de Cardiologia para ajudar os brasileiros a viverem mais e com muito' 
                'mais saúde.',
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 16)
          ),
        ),
        Image.asset('assets/images/good-health.jpg')
      ],
  );
}

info2(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Tenha Alimentação Saudável. Receitas simples, como saladas e pratos leves, não aumentam o' 
              'colesterol e são fáceis de ser preparadas em casa.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16)
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 18),
        child: Image.asset('assets/images/alimentos-saudaveis.jpg'),
      )
    ],
  );
}

info3(){
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Pratique exercícios físicos com orientação médica. Corridas com caminhadas, fazer' 
            'hidroginástica ou utilizar esteira e bibicleta ergométricas auxiliam na melhora do' 
            'condicionamento físico.',
          textAlign: TextAlign.justify,
          style: TextStyle(fontSize: 16)
        ),
      ),
      Image.asset('assets/images/vida-saudavel.jpg')
    ],
  );
}