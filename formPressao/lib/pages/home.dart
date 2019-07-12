import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:top1_nota2/pages/sobre.dart';
import 'package:top1_nota2/pages/tabBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var url = 'https://st4.depositphotos.com/14846838/22137/v/1600/depositphotos_221379676-stock-illustration-person-avatar-stethoscope-symbolizing-part.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Avaliador de pressão'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Página Inicial')
          ],
        )
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('data'),
              accountEmail: null,
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(url),
              ),
            ),
            ListTile(
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
              title: Text('Sobre nós'),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SobrePage()));
              },
            )
          ],
        ),
      )
    );
  }
}
