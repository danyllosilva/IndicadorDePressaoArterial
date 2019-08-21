import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'resultado.dart';

//Global Variables
int _radioValue = 0, _pressSis = 120, _pressDias = 80;
bool _checkValueSaudavel = true, _checkValueNaoSaudavel = false;
String _nome, _sexo = "Masculino", _tipoPessoa = "Idoso", _perfilMedico = "Saudável";

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

  void _handleCheckValueChange(int flag, bool value) {
     setState(() {
      _checkValueSaudavel = value;
      _checkValueNaoSaudavel = value;

    if(flag == 0){
      switch (_checkValueSaudavel) {
        case true:
          _checkValueNaoSaudavel = false;
          _perfilMedico = "Saudável";
          break;
        case false:
          _checkValueNaoSaudavel = true;
          _perfilMedico = "Possui estresse, hipertensão, diabetes ou outra enfermidade.";
          break;
      }
    }else if(flag == 1){
      switch(_checkValueNaoSaudavel){
        case true:
          _checkValueSaudavel = false;
          _perfilMedico = "Possui estresse, hipertensão, diabetes ou outra enfermidade.";
          break;
        case false:
          _checkValueSaudavel = true;
          _perfilMedico = "Saudável";
          break;
        default:
          _checkValueSaudavel = false;
          _checkValueNaoSaudavel = false;
      }
    }
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
     key: _keyScaffold,
     appBar: AppBar(
       backgroundColor: Colors.green,
       title: Text("Indicador de Pressão Arterial")
     ),
     
     body: SingleChildScrollView(child: forms()),
    );  
  }

 Form forms(){
    
  return Form(

       key: _keyForm,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
          Text(
            "Obs.:",
            style: TextStyle(fontWeight: FontWeight.bold)),
          Text("\t Se a sua pressão for 120/80, então 120 é a pressão" 
          +"\n\tsistólica e 80 é a pressão diastólica.",
          style: TextStyle(fontStyle: FontStyle.italic)),
          Text("\n\tSelecione abaixo o tipo de pessoa: "),
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
          
          Text(
            "\n\tVocẽ possui algum quadro de estresse,"+
            "hipertensão, diabetes, ou outra enfermidade?"
            ,textAlign: TextAlign.center,
           
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Checkbox(
            value: _checkValueSaudavel,
            onChanged: (bool value){
              setState((){
                _handleCheckValueChange(0, value);
              });
            },
            activeColor: Colors.green,
          ),
          Text("Não, sou saudável."),
          Checkbox(
            value: _checkValueNaoSaudavel,
            onChanged: (bool value){
              setState((){
                _handleCheckValueChange(1, value);
              });
            },
            activeColor: Colors.green,
          ),
          Text("Sim, possuo."),
          ],),
          
          Text("\nPor favor, nos informe abaixo: "),
          TextFormField(
              inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                labelText: "Seu nome: ",
                hintText: "Por ex.: Fulano da Silva.",
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
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
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
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
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
            RaisedButton.icon(
              label: Text('CALCULAR RESULTADO'),
              icon: Icon(MdiIcons.calculator),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: (){
               // Navigator.of(context).pop();
                
                if(_keyForm.currentState.validate()) {
                    _keyForm.currentState.save();
                  
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => Resultado(_nome, _sexo, _tipoPessoa, _perfilMedico, _pressSis, _pressDias)));
                  
                }
              }
            )  
            ],
         ),

     );
  }
}
