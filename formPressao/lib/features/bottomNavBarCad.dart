import 'package:flutter/material.dart';
import 'package:indpress/pages/cadPaciente.dart';
import 'package:indpress/pages/listaPaciente.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BottomNavBarCad extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BottomNavBarCadState();
}

class _BottomNavBarCadState extends State<BottomNavBarCad>{
int _pagina = 0;
  final _opcoes = [
    CadastrarPaciente(),
    ListaPaciente()
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
            title: Text('Cadastro',
                        style: TextStyle(color: Colors.green)),
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.signCaution,color: Colors.orange),
            title: Text('Lista',
                        style: TextStyle(color: Colors.orange))
          ),
        ],
        unselectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
      ),
    );
  }
}