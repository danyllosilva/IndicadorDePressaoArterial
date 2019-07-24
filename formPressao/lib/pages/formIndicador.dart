
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'resultado.dart';

//Global Variables
int _radioValue = 0, _pressSis = 120, _pressDias = 80;
String _nome, _sexo, _tipoPessoa = "Idoso";

class Indicador extends StatefulWidget{
  
  @override
  _IndicadorState createState() => _IndicadorState();
}

class _IndicadorState extends State<Indicador> {
  //Chave global
  final _keyForm = GlobalKey<FormState>(); 
  final _keyScaffold = GlobalKey<ScaffoldState>();

  void _handleRadioValueChange(int value) {
     setState(() {
      _radioValue = value;
  
      switch (_radioValue) {
        case 0:
          _sexo = "Masculino";
          break;
        case 1:
          _sexo = "Feminino";
          break;
        case 2:
          _sexo = "Outro";
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     key: _keyScaffold,
     appBar: AppBar(
       backgroundColor: Colors.green,
       title: Text("Avaliador de Pressão Arterial")
     ),
     
     body: forms(),
        
    );  
  }

 Form forms(){
    
  return Form(

       key: _keyForm,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
          Text("\n \tObs.: Se a sua pressão for 120/80, então 120 é a pressão sistólica e 80 é a pressão diastólica."),
          Text("\nSelecione abaixo o tipo de pessoa: "),
          DropdownButton<String>(
          value: _tipoPessoa,
          onChanged: (String newValue) {
          setState(() {
            _tipoPessoa = newValue;
        
          });
        },
        items: <String>["Criança", "Adulto", "Idoso"]
          .map<DropdownMenuItem<String>>((String value)
            => DropdownMenuItem<String>(
              value: value,
              child: Text(value), 
            ),
          ).toList(),

          ),
          Text('Selecione o sexo: '),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Radio(
              value: 0,
              groupValue: _radioValue,
              onChanged: (int value) {
                setState((){
                  _handleRadioValueChange(value);
                });
              },
              activeColor: Colors.green
            ),
            Text("Masculino"),

            Radio(
            value: 1,
            groupValue: _radioValue,
            onChanged: (int value) { 
               setState(() {
                _handleRadioValueChange(value);
               });
             },
             activeColor: Colors.green,
          ),
          Text("Feminino"),

            Radio(
              value: 2,
              groupValue: _radioValue,
              onChanged: (int value){
                setState(() {
                  _handleRadioValueChange(value);
        
                });
              },
              activeColor: Colors.green
              ),
          Text("Outro"),
            ]

          ),
          Text("\nPor favor, nos informe abaixo: "),
          TextFormField(
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Seu nome: ",
                hintText: "Por ex.: Fulano da Silva."
              ),
              validator: (value){
                String _retorno;
                
                if(value.isEmpty){
                  _retorno = "O campo de Nome não pode ficar em branco.";
                }
                return _retorno;
              },
              onSaved: (value){
                _nome = value;
              },
          ),
          TextFormField(
              maxLength: 3,
              initialValue: _pressSis.toString(),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "\t Sua pressão arterial sistólica: ",
                hintText: "P/ pressão arterial = 120/80: 120 é a pressão sistólica.", 
              ),
              validator: (value){
              String _retorno;

              if(value.isEmpty){
                final snackbar = SnackBar(content: Text("O campo de pressão sistólica não pode ficar em branco."),);
                _keyScaffold.currentState.showSnackBar(snackbar);

                _retorno = 'Campo de pressão sistólica está em branco.';
              }
                return _retorno;
            },
            onSaved: (value){
              _pressSis = int.parse(value);
        
            }
            ),
            
            TextFormField(
              maxLength: 2,
              initialValue: _pressDias.toString(),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '\t Sua pressão arterial diastólica: ',
                hintText: 'P/ pressão arterial = 120/80: 80 é a pressão diastólica.'
              ),

            validator: (value){
              String _retorno;

              if(value.isEmpty){
                final snackbar = SnackBar(content: Text("O campo de pressão arterial diastólica não pode ficar em branco."),);
                _keyScaffold.currentState.showSnackBar(snackbar);

              _retorno = "Campo de pressão arterial diastólica está em branco.";
              }

              return _retorno;
            },
            
            onSaved: (value){
              _pressDias = int.parse(value);
            }
            ),
            Text("\n"),
            RaisedButton(
              child: Text('CALCULAR RESULTADO'),
              onPressed: (){
               // Navigator.of(context).pop();
                
                if(_keyForm.currentState.validate()) {
                    _keyForm.currentState.save();
                  
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Resultado(_nome, _sexo, _tipoPessoa, _pressSis, _pressDias)));
                  
                }
              }
            )  
            ],
         ),

     );
  }
}
