import 'dart:async';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'paciente.dart';
import 'package:http/http.dart' as http;
 
class DBPaciente {
  static Database _db;  
  static const String TABLE = 'paciente';
  static const String DB_NAME = 'paciente.db';
  static const String ID = 'id';
  static const String NOME = 'nome';
  static const String PERFIL = 'perfil';
  static const String SEXO = 'sexo';
  static const String CPF = 'cpf';
  static const String IDADE = 'idade';
  static const String DTNASCIMENTO = 'dtNascimento';
  static const String ENDERECO = 'endereco';
  static const String TELEFONE = 'telefone';


  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }
 
  initDb() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, DB_NAME);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  // Código SQL para criar o banco de dados e a tabela
  Future _onCreate(Database db, int version) async {
    await db.execute('''
            CREATE TABLE $TABLE (
              $ID INTEGER PRIMARY KEY AUTOINCREMENT,
              $NOME TEXT NOT NULL,
              $PERFIL TEXT NOT NULL,
              $SEXO TEXT NOT NULL,
              $CPF TEXT NOT NULL,
              $IDADE INTEGER NOT NULL,
              $DTNASCIMENTO TEXT NOT NULL,
              $ENDERECO TEXT NOT NULL,
              $TELEFONE TEXT NOT NULL
            )
          ''');
  }  

  Future<Paciente> salvar(Paciente paciente) async {
    var dbClient = await db;
    paciente.id = await dbClient.insert(TABLE, paciente.toMap());
    return paciente;
  }

  void obtemPacientesdaWeb() async{
  String url = "http://www.mocky.io/v2/5d66f53f3300004ca4449fa0"; 
  http.Response resposta = await http.get(url);
  if (resposta.statusCode == HttpStatus.ok) {
    var listapacientes = convert.jsonDecode(resposta.body);
    for (var pacientejson in listapacientes) {
     
      Paciente p = new Paciente(
        pacientejson.nome,
        pacientejson.perfil,
        pacientejson.sexo,
        pacientejson.cpf,
        pacientejson.idade,
        pacientejson.dtNascimento,
        pacientejson.endereco,
        pacientejson.telefone
      );

      salvar(p);
    }
  }
}
 
  Future<List> getPacientes() async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $TABLE");
    return result.toList();
  }
 
  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient.delete(TABLE, where: '$ID = ?', whereArgs: [id]);
  }
 
  Future<int> update(Paciente paciente) async {
    var dbClient = await db;
    return await dbClient.update(TABLE, paciente.toMap(),
        where: '$ID = ?', whereArgs: [paciente.id]);
  }
 
  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }

  Future getPaciente(int id) async {
    var dbClient = await db;
    var result = await dbClient.rawQuery("SELECT * FROM $TABLE WHERE $ID = $id");
    
    return result.toList();
  }
}