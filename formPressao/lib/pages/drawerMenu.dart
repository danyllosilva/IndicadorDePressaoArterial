import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'formIndicador.dart';
import 'home.dart';
import 'sobre.dart';
import 'tiposPressao.dart';

class DrawerMenu extends StatefulWidget {
  @override
  _DrawerMenuState createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(MdiIcons.homeOutline),
              title: Text('Página Inicial'),
              onTap: (){
                //Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HomePage()));
              },
            ),
            Divider(
              height: 0.7,
            ),
            ListTile(
              leading: Icon(MdiIcons.stethoscope),
              title: Text('Indicador de Pressão'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>Indicador()));
              },
            ),
            Divider(
              height: 0.7,
            ),ListTile(
              leading: Icon(MdiIcons.more),
              title: Text('Tipos de Pressão'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TiposPressao()));
              },
            ),
            Divider(
              height: 0.7,
            ),
            ListTile(
              leading: Icon(MdiIcons.pencilBoxOutline),
              title: Text('Sobre Nós'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SobrePage()));
              },
            )
          ],
        ),
      );
  }
}