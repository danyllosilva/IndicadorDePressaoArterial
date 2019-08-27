import 'dart:ui' as prefix0;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:indpress/pages/paciente.dart';

import 'db_paciente.dart';

//var dbPaciente = DBPaciente();
//Future<List<Paciente>> pacientes;

class ListaPaciente extends StatefulWidget {
  @override
  _ListaPacienteState createState() => _ListaPacienteState();
}

class _ListaPacienteState extends State<ListaPaciente> {
 /*  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Lista de Pacientes'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
      body: list()
      )
    );
  }

  /* BidirectionalScrollViewPlugin dataTable(List<Paciente> pacientes) {
    return new BidirectionalScrollViewPlugin(
      child: DataTable(
        columns: [
          DataColumn(
            label: Text('NOME'),
          ),
          DataColumn(
            label: Text('IDADE'),
          ),
          DataColumn(
            label: Text('DATA NASCIMENTO'),
          )
        ],
        rows: pacientes
            .map(
              (paciente) => DataRow(cells: [
                    DataCell(
                      Text(paciente.nome),
                    ),
                    DataCell(
                      Text(paciente.idade.toString()),
                    ),
                    DataCell(
                      Text(paciente.dtNascimento),
                    )
                    /* DataCell(IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        dbHelper.delete(paciente.id);
                        refreshList();
                      },
                    )), */
                  ]),
            )
            .toList(),
      ),
    );
  } */

  listViewPac(List<Paciente> pacientes) {
    ListView.builder(
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
                  '${pacientes[position].idade}',
                  style: new TextStyle(
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              )
          ]
        );
      }
    );
  }
 
  list() {
    setState(() {
      pacientes = dbPaciente.getPacientes();
    });
    
    return Expanded(
      child: FutureBuilder(
        future: pacientes,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return listViewPac(snapshot.data);
          }
 
          if (null == snapshot.data || snapshot.data.length == 0) {
            return Text("Nenhum Paciente");
          }
 
          return new CircularProgressIndicator(backgroundColor: Colors.amber);
        },
      ),
    );
  } */

List<Paciente> pacientes = new List();
DBPaciente db = new DBPaciente();
 
  @override
  void initState() {
    super.initState();
 
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