import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:indpress/features/maskedText.dart';
import 'package:indpress/features/cpfValidator.dart';

//Global Variables
int _radioValue = 0, _idade;
bool _checkValueSaudavel = true, _checkValueNaoSaudavel = false;
String _cpf, _nome, _sexo = "Feminino", 
_perfilMedico = "Saudável", _dataNascimento, _endereco, _telefone;
var controllerCPF = new MaskedTextController(mask: '000.000.000-00');
var controllerData = new MaskedTextController(mask: '00/00/0000');
var controllerTel = new MaskedTextController(mask: '(00) 9 0000-0000');

class CadastrarPaciente extends StatefulWidget{
  
  @override
  _CadastrarPacienteState createState() => _CadastrarPacienteState();
}

class _CadastrarPacienteState extends State<CadastrarPaciente> {
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
          _perfilMedico = "Possui estresse, hipertensão ou diabetes.";
          break;
      }
    }else if(flag == 1){
      switch(_checkValueNaoSaudavel){
        case true:
          _checkValueSaudavel = false;
          _perfilMedico = "Possui estresse, hipertensão ou diabetes.";
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
       title: Text("Cadastrar paciente")
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
          Text('\nInforme abaixo o seu sexo: '),
          
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

            ]

          ),
          
          Text(
            "\n\t Possui histórico de estresse, "+
            "hipertensão ou diabetes?"
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
          TextFormField(
              controller: controllerCPF,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "\t CPF: ",
                hintText: "Por favor, respeite o formato: 000.000.000-00.",
              ),
              validator: (value){
                String _retorno;

                if(value.isEmpty){
                  final snackbar = SnackBar(content: Text("\t O campo CPF não pode ficar em branco."),);
                _retorno = "\t Este campo não pode ficar em branco.";
                _keyScaffold.currentState.showSnackBar(snackbar);
                }

                if(!CPFValidator.isValid(value)){
                  final snackbar = SnackBar(content: Text("\t O CPF digitado é inválido."),);
                _retorno = "\t Por favor, digite um CPF válido e tente novamente.";
                _keyScaffold.currentState.showSnackBar(snackbar);
                }
                return _retorno;
              },
              onSaved: (value){
                _cpf = value;
              },
          ),
          TextFormField(
              maxLength: 100,
              inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z]"))],
              initialValue: _nome,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                labelText: "\t Nome: ",
                hintText: "Digite aqui o seu nome.", 
              ),
              validator: (value){
              String _retorno;

              if(value.isEmpty){
                final snackbar = SnackBar(content: Text("\t O campo Nome não pode ficar em branco."),);
                _keyScaffold.currentState.showSnackBar(snackbar);

                _retorno = '\t Campo Idade está em branco.';
              }
                return _retorno;
            },
            onSaved: (value){
              _nome = value;
        
            }
            ),
            
            TextFormField(
              maxLength: 2,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '\t Idade: ',
                hintText: 'Digite aqui a sua idade.'
              ),

            validator: (value){
              String _retorno;

              if(value.isEmpty){
                final snackbar = SnackBar(content: Text("\t O campo de idade não pode ficar em branco."),);
                _keyScaffold.currentState.showSnackBar(snackbar);

              _retorno = "\t Campo Idade está em branco.";
              }

              return _retorno;
            },
            
            onSaved: (value){
              _idade = int.parse(value);
            }
            ),
            TextFormField(
              controller: controllerData,
              maxLength: 10,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '\t Data de nascimento: ',
                hintText: 'P. Ex. DD/MM/AAAAA.'
              ),

            validator: (value){
              String _retorno;

              if(value.isEmpty){
                final snackbar = SnackBar(
                content: 
                Text('\t O campo Data de Nascimento'+
                'não pode ficar em branco.')
                ,);
                _keyScaffold.currentState.showSnackBar(snackbar);

              _retorno = "\t Campo Data de Nascimento está em branco.";
              }

              var date = value.split("/");
              int day = int.parse(date[0]);
              int month = int.parse(date[1]);
              int year = int.parse(date[2]);
              if((day <= 0  || day > 31) || (month <= 00 || month > 12) || (year < 1800 || year > 2019)){
                 final snackbar = SnackBar(
                content: 
                Text('\t A Data de Nascimento informada'+
                ' é inválida.')
                ,);
                _keyScaffold.currentState.showSnackBar(snackbar);
              _retorno = "\t Por favor, verifique se a data de nascimento está correta.";
              }

              return _retorno;
            },
            
            onSaved: (value){
              _dataNascimento = value;
            }
            ),
           
            TextFormField(
              maxLength: 8,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '\t Endereço: ',
                hintText: 'P. Ex. Rua das Salamandras, 2000, Bairro Vicente de Paula.'
              ),

            validator: (value){
              String _retorno;

              if(value.isEmpty){
                final snackbar = SnackBar(content: Text("\t O campo Endereço não pode ficar em branco."),);
                _keyScaffold.currentState.showSnackBar(snackbar);

              _retorno = "\t Campo Endereço está em branco.";
              }

              return _retorno;
            },
            
            onSaved: (value){
              _endereco = value;
            }
            ),
            TextFormField(
              controller: controllerTel,
              maxLength: 8,
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: '\t Telefone: ',
                hintText: 'P. Ex. (DD) 9 8888-8888.'
              ),

            validator: (value){
              String _retorno;

              if(value.isEmpty){
                final snackbar = SnackBar(content: Text("\t O campo Telefone não pode ficar em branco."),);
                _keyScaffold.currentState.showSnackBar(snackbar);

              _retorno = "\t Campo Telefone está em branco.";
              }

              return _retorno;
            },
            
            onSaved: (value){
              _telefone = value;
            }
            ),
            RaisedButton.icon(
              label: Text('CADASTRAR PACIENTE'),
              icon: Icon(MdiIcons.account),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: (){
                
                if(_keyForm.currentState.validate()) {
                    _keyForm.currentState.save();
                  
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) => CadastrarPaciente()));
                  
                }
              }
            )  
            ],
         ),

     );
  }
}
