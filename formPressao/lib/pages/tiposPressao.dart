import 'package:indpress/features/bottomNavBar.dart';
import 'package:flutter/material.dart';

import 'package:indpress/features/drawerMenu.dart';

class TiposPressao extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BottomNavBar(),
    );
  }
}

class PressaoNormal extends StatelessWidget {

  final DrawerMenu drawer = new DrawerMenu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pressão Normal'),
      ),
      drawer: drawer,
      body: SingleChildScrollView(
        child: Center(
          child:Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10),
                child: Image.asset('assets/images/img_niveis_pressao-normal.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text('A pressão é considerada normal, quando, na média, máxima em 120 e mínima em 80 milímetros de mercúrio, ou simplesmente 12 por 8.'
                            'Valores inferiores a 14 por 9 podem ser considerados normais a critério médico',
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.justify
                      ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PressaoLimitrofe extends StatelessWidget {

  final DrawerMenu drawer = new DrawerMenu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pressão Limítrofe'),
      ),
      drawer: drawer,
      body: SingleChildScrollView(
        child: Center(
          child:Column(
            children: <Widget>[
              Image.asset('assets/images/img_niveis_pressao-limitrofe.jpg'),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text('Quem possui pressão arterial limítrofe (acima de 12 por 8 e inferior a 14 por 9) deve fazer controle médico periódico e'
                            'seguir as orientações dadas por aquele profissional para prevenir e controlar a hipertensão.',
                      style: TextStyle(fontSize: 22),
                      textAlign: TextAlign.justify
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class PressaoAlta extends StatelessWidget {

  final DrawerMenu drawer = new DrawerMenu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Pressão Alta'),
      ),
      drawer: drawer,
      body: SingleChildScrollView(
        child: Center(
          child:Column(
            children: <Widget>[
              Image.asset('assets/images/img_niveis_pressao-alta.jpg'),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text('Hipertensão arterial acontece quando a nossa pressão está acima do limite considerado normal.'
                            'As pessoas que têm familiares hipertensos, que não têm hábitos alimentares saudáveis, ingerem muito sal,'
                            'estão acima do peso, exageram no consumo de álcool ou são diabéticas têm mais risco de desenvolver a hipertensão.',
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.justify
                      )
              )
            ],
          ),
        ),
      ),
    );
  }
}

/* class TiposPressaoTabBar extends StatefulWidget {
  TiposPressaoTabBar({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _TiposPressaoTabBarState createState() => new _TiposPressaoTabBarState();
}

class _TiposPressaoTabBarState extends State<TiposPressaoTabBar> {

  DrawerMenu drawer = new DrawerMenu();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('Atenção à sua Pressão'),
      ),
      drawer: drawer,
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
} */