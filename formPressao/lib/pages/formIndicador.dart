
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'resultado.dart';

//Global Variables
int _radioValue = 1, _dropdownValue = 120, _pressSis = 120, _pressDias = 80;

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
          _pressDias = 60;
          break;
        case 1:
          _pressDias = 80;
          break;
        case 2:
          _pressDias = 120;
          break;
        case 3:
          _pressDias = 140;
          break;
        case 4:
          _pressDias = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     key: _keyScaffold,
     appBar: AppBar(
       backgroundColor: Colors.green,
       title: Text("Avaliador de Pressão")
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
          Text("\nSelecione uma das opções de pressão sistólica: "),
          DropdownButton<int>(
          value: _dropdownValue,
          onChanged: (int newValue) {
          setState(() {
            _dropdownValue = newValue;
        
          });
        },
        items: <int>[60, 80, 90, 120, 140]
          .map<DropdownMenuItem<int>>((int value)
            => DropdownMenuItem<int>(
              value: value,
              child: Text(value.toString()), 
            ),
          ).toList(),

          ),
          Text('Selecione uma das opções de pressão diastólica: '),
          
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
            Text("60"),

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
          Text("80"),

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
          Text("120"),

            Radio(
            value: 3,
            groupValue: _radioValue,
            onChanged: (int value){
              setState(() {
                _handleRadioValueChange(value);
        
              });
            },
            activeColor: Colors.green
            ),
            Text("140"),
            ],
         
          ),

          Text("\nNenhum desses acima? Então nos informe abaixo: "),

          TextFormField(
              //maxLength: 3,
              
              textInputAction: TextInputAction.go,
              initialValue: _pressSis.toString(),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "\t Informe aqui sua pressão arterial sistólica: ",
                hintText: "P/ pressão arterial = 120/80: 120 é a pressão sistólica.", 
              ),
              validator: (value){
              if(value.isEmpty && _pressSis == null){
                final snackbar = SnackBar(content: Text("O campo de pressão sistólica não pode ficar em branco."),);
                _keyScaffold.currentState.showSnackBar(snackbar);

                return 'Campo de pressão sistólica está em branco.';
              }
            },
            onSaved: (value){
              _pressSis = int.parse(value);
        
            }
            ),
            
            TextFormField(
              
              //maxLength: 3,
              textInputAction: TextInputAction.go,
              initialValue: _pressDias.toString(),
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '\t Informe aqui a sua pressão arterial diastólica: ',
                hintText: 'P/ pressão arterial = 120/80: 80 é a pressão diastólica.'
              ),

            validator: (value){
              if(value.isEmpty && _pressDias == null){
                final snackbar = SnackBar(content: Text("O campo de pressão arterial diastólica não pode ficar em branco."),);
                _keyScaffold.currentState.showSnackBar(snackbar);

              return "Campo de pressão arterial diastólica está em branco.";
              }
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
                  
                  if(_dropdownValue == 120 && _pressDias == 80){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Resultado(_dropdownValue, _pressDias)));
                  }else {
                    try{
                      _keyForm.currentState.save();
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Resultado(_pressSis, _pressDias)));
                    } catch(FormatException){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Resultado(_dropdownValue, _pressDias)));
                    }
                }
              }
            }
            )  
            ],
         ),

     );
  }
}
