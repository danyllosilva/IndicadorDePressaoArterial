import 'dart:async';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'paciente.dart';
 
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
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
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
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }
 
  Future<List> getPacientes() async {
    var dbClient = await db;
    /* List<Map> maps = await dbClient.query(TABLE, columns: [ID, NOME, PERFIL, SEXO, CPF, IDADE,
                                                            DTNASCIMENTO, ENDERECO, TELEFONE]); */
    var result = await dbClient.rawQuery("SELECT * FROM $TABLE");
    /* List<Paciente> pacientes = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        pacientes.add(Paciente.fromMap(maps[i]));
      }
    }
    return pacientes; */
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
    /* List<Paciente> pacientes = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        pacientes.add(Paciente.fromMap(maps[i]));
      }
    }
    return pacientes; */
    return result.toList();
  }
}