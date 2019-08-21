import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'package:indpress/pages/tiposPressao.dart';

class BottomNavBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar>{
int _pagina = 0;
  final _opcoes = [
    PressaoNormal(),
    PressaoLimitrofe(),
    PressaoAlta()
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
            icon: Icon(MdiIcons.arrowExpandHorizontal,color: Colors.green),
            title: Text('Pressão Normal',
                        style: TextStyle(color: Colors.green)),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.signCaution,color: Colors.orange),
            title: Text('Pressão Limítrofe',
                        style: TextStyle(color: Colors.orange))
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.arrowUpBold,color: Colors.red),
            title: Text('Pressão Alta',
                        style: TextStyle(color: Colors.red))
          )
        ],
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}