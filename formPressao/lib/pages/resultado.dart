import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  int pressSis, pressDias;
  String nome = "", sexo = "", tipoPessoa = "";
  
  Resultado(this.nome, this.sexo, this.tipoPessoa, this.pressSis, this.pressDias);
  
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
        "Nome: \n"+nome.toString()+
        "\n\nTipo de pessoa: \n"+tipoPessoa.toString()+
        "\n\nSexo: \n"+sexo.toString(),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.green)
        ),

        verificaPressao(nome, sexo, tipoPessoa, pressSis, pressDias),
        
    ],
    )
  )
  );
  }
}

Text verificaPressao(String nome, String sexo, String tipoPessoa, 
                      int pressaoSistolica, int pressaoDiastolica){
  
  if((pressaoSistolica >= 100 && pressaoSistolica <= 129) &&
      (pressaoDiastolica >= 60 && pressaoDiastolica <= 84) ){
      return Text("\nA sua pressão arterial está NORMAL.", 
            textAlign: TextAlign.center, 
            style: TextStyle(fontSize: 20, color: Colors.green),);
  
  }else if((pressaoSistolica >= 130 && pressaoSistolica <= 139) &&
          (pressaoDiastolica >= 85 && pressaoDiastolica <= 89) ){
      return Text("\nCuidado! A sua pressão arterial está em estado de ALERTA."
            , textAlign: TextAlign.center,
            style: TextStyle(fontSize:20, color: Colors.purple));
  }else {
     return Text("\nPressão Arterial em estado CRÍTICO! \nProcure um Médico."
            , textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, color: Colors.red));
    }
}
