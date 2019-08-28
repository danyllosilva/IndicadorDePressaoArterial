import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:indpress/pages/paciente.dart';

import 'db_paciente.dart';

class ListaPaciente extends StatefulWidget {
  @override
  _ListaPacienteState createState() => _ListaPacienteState();
}

class _ListaPacienteState extends State<ListaPaciente> {
 
List<Paciente> pacientes = new List();
DBPaciente db = new DBPaciente();
 
  @override
  void initState() {
    super.initState();
    print('lista');

    db.obtemPacientesdaWeb();

    db.getPacientes().then((pcts) {
      setState(() {
        pcts.forEach((pct) {
          pacientes.add(Paciente.fromMap(pct));
        });
      });
    });
  }
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Pacientes'),
          centerTitle: true,
          backgroundColor: Colors.green,
        ),
      body: Center(
        child: ListView.builder(
          itemCount: pacientes.length,
          padding: const EdgeInsets.all(15.0),
          itemBuilder: (context, position) {
            return Column(
              children: <Widget>[
                Divider(height: 5.0),
                ListTile(
                  title: Text(
                    '${pacientes[position].nome}',
                    style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.deepOrangeAccent,
                    ),
                  ),
                  subtitle: Text(
                    '${pacientes[position].perfil}; \n' +
                    'Meu CPF é o ${pacientes[position].cpf}; \n' +
                    'Possuo ${pacientes[position].idade} anos de idade; \n' +
                    'Nasci em ${pacientes[position].dtNascimento}; \n' +
                    'Sou do sexo ${pacientes[position].sexo}; \n' +
                    'Moro em ${pacientes[position].endereco}; \n'
                    'Meu contato é o ${pacientes[position].telefone}. \n',
                    style: new TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    ),
                  ),

                  onTap: (){ 
                    //detalhes(pacientes[position].id);
                  },
                )
              ]
            );
          }
        )
      )
    )
  );
  }
}