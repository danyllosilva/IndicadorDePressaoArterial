import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  int pressSis, pressDias;
  
  Resultado(this.pressSis, this.pressDias);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
    title: Text("Resultado"),
    backgroundColor: Colors.green
  ),

  body: Center(
    
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
        Text(
          verificaPressao(pressSis, pressDias), 
          textAlign: TextAlign.center,
          style: 
          TextStyle(
            fontSize: 30, 
            color: Colors.blue)
        ),

    ],
    )
  )
  );
  }
}

String verificaPressao(int pressaoSistolica, int pressaoDiastolica){
  if(pressaoSistolica >= 100 && pressaoSistolica <= 129){
    if(pressaoDiastolica >= 60 && pressaoDiastolica <= 84){
     return "Parabéns! A sua pressão arterial está normal!!!";
    }
  }else if(pressaoSistolica >= 130 && pressaoSistolica <= 139){
      if(pressaoDiastolica >= 85 && pressaoDiastolica <= 89){
      return "Atenção! A sua pressão arterial está normal, porém limítrofe!!!";
      }
    } else {
     return "A sua pressão está crítica. \nPor favor, procure um médico.";
    }
}
