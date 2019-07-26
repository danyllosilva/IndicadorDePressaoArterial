import 'package:flutter/material.dart';

//import 'drawerMenu.dart';

class TiposPressaoTabBar extends StatefulWidget {
  TiposPressaoTabBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TiposPressaoTabBarState createState() => new _TiposPressaoTabBarState();
}

class _TiposPressaoTabBarState extends State<TiposPressaoTabBar> {

  //DrawerMenu drawer = new DrawerMenu();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Atenção à sua Pressão'),
      ),
      //drawer: drawer,
      body:Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 8.0),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: 'pressaoBaixa',
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PressaoBaixaHero())),
                    child: Image.asset('assets/images/pressaoBaixa.jpg', height: 100)
                  )
                ),Text('Pressão Baixa',style: TextStyle(fontSize: 22))
              ],
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 70),
            child: Row(
              children: <Widget>[
                Text('Pressão Normal',style: TextStyle(fontSize: 22)),
                Hero(
                  tag: 'pressaoNormal',
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PressaoNormalHero())),
                    child: Image.asset('assets/images/pressaoNormal250.jpg', height: 100)
                  )
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:70, left: 8.0),
            child: Row(
              children: <Widget>[
                Hero(
                  tag: 'pressaoAlta',
                  child: GestureDetector(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PressaoAltaHero())),
                    child: Image.asset('assets/images/pressaoAlta250.jpg', height: 100)
                  )
                ),Text('Pressão Alta',style: TextStyle(fontSize: 22))
              ],
            ),
          ),
          
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
              child: Image.asset('assets/images/pressaoBaixa250.jpg')
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text('A pré-hipertensão consiste numa pressão sanguínea que está entre 120-139/80-89.',
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.justify
              ),
            ),
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
              child: Image.asset('assets/images/pressaoNormal250.jpg')
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text('A pré-hipertensão consiste numa pressão sanguínea que está entre 120-139/80-89.',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.justify
                    ),
            ),
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
              child: Image.asset('assets/images/pressaoAlta250.jpg')
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text('A pré-hipertensão consiste numa pressão sanguínea que está entre 120-139/80-89.',
                          style: TextStyle(fontSize: 22),
                          textAlign: TextAlign.justify
                    )
            ),
            Icon(Icons.arrow_upward,color: Colors.red,size: 100,)
          ],
        ),
      ),
    );
  }
}