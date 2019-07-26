import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'formIndicador.dart';
import 'home.dart';
import 'sobre.dart';
import 'tiposPressao.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>{
int _pagina = 0;
  final _opcoes = [
    HomePage(),
    Indicador(),
    TiposPressaoTabBar(),
    SobrePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _opcoes[_pagina],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pagina,
        onTap: (int index){
          setState((){
            _pagina = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.homeOutline),
            title: Text('Página Inicial')
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.stethoscope),
            title: Text('Ind. Pressão'),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.more),
            title: Text('Tipos de Pressão')
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.pencilBoxOutline),
            title: Text('Sobre Nós')
          ),
        ],
        fixedColor: Colors.green,
        unselectedItemColor: Colors.black,type: BottomNavigationBarType.shifting,
      ),
    );
  }
}