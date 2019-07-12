import 'package:flutter/material.dart';

import 'home.dart';
import 'sobre.dart';

class TiposPressaoTabBar extends StatefulWidget {
  TiposPressaoTabBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TiposPressaoTabBarState createState() => new _TiposPressaoTabBarState();
}

class _TiposPressaoTabBarState extends State<TiposPressaoTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Atenção à sua Pressão'),
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
      body:Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10)
          ),
          Hero(
            tag: 'pressaoBaixa',
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PressaoBaixaHero())),
              child: FlutterLogo(size: 100)
            )
          ),
          Text('Pressão Baixa',style: TextStyle(fontSize: 22)),
          Padding(
            padding: EdgeInsets.only(top: 50)
          ),
          Hero(
            tag: 'pressaoNormal',
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PressaoNormalHero())),
              child: FlutterLogo(size: 100)
            )
          ),
          Text('Pressão Normal',style: TextStyle(fontSize: 22)),
          Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Hero(
            tag: 'pressaoAlta',
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PressaoAltaHero())),
              child: FlutterLogo(size: 100)
            )
          ),
          Text('Pressão Alta',style: TextStyle(fontSize: 22))
        ],
      )
    );
  }
}

class PressaoBaixaHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pressão Baixa'),
      ),
      body: Center(
        child:Column(
          children: <Widget>[
            Hero(
              tag: 'pressaoBaixa',
              child: FlutterLogo(size: 200.0)
            ),
            Text('A pré-hipertensão consiste numa pressão sanguínea que está entre 120-139/80-89.'),
            Icon(Icons.arrow_downward,color: Colors.blue,size: 100),
          ],
        ),
      ),
    );
  }
}

class PressaoNormalHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pressão Normal'),
      ),
      body: Center(
        child:Column(
          children: <Widget>[
            Hero(
              tag: 'pressaoNormal',
              child: FlutterLogo(size: 200.0)
            ),
            Text('A pré-hipertensão consiste numa pressão sanguínea que está entre 120-139/80-89.'),
            Icon(Icons.check_box,color: Colors.greenAccent,size: 100),
          ],
        ),
      ),
    );
  }
}

class PressaoAltaHero extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pressão Alta'),
      ),
      body: Center(
        child:Column(
          children: <Widget>[
            Hero(
              tag: 'pressaoAlta',
              child: FlutterLogo(size: 200.0)
            ),
            Text('A pré-hipertensão consiste numa pressão sanguínea que está entre 120-139/80-89.'),
            Icon(Icons.arrow_upward,color: Colors.red,size: 100,)
          ],
        ),
      ),
    );
  }
}