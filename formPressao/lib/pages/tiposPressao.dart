import 'package:flutter/material.dart';

class TiposPressaoTabBar extends StatefulWidget {
  TiposPressaoTabBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TiposPressaoTabBarState createState() => new _TiposPressaoTabBarState();
}

class _TiposPressaoTabBarState extends State<TiposPressaoTabBar> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.green,
        title: new Text('Atenção à sua Pressão'),
      ),
      body:Column(
        children: <Widget>[
          Hero(
            tag: 'pressaoBaixa',
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PressaoBaixaHero())),
              child: FlutterLogo(size: 100)
            )
          ),
          Text('Pressão Baixa'),
          Hero(
            tag: 'pressaoNormal',
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PressaoNormalHero())),
              child: FlutterLogo(size: 100)
            )
          ),
          Text('Pressão Normal'),
          Hero(
            tag: 'pressaoAlta',
            child: GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PressaoAltaHero())),
              child: FlutterLogo(size: 100)
            )
          ),
          Text('Pressão Alta')
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