import 'dart:async';
import 'package:app_facul/database/sqlite/script.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    // ignore: unnecessary_null_comparison
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'banco_contatos'); // Define o caminho do banco de dados.
      _db = await openDatabase(
        path,
        version: 1, 
        onCreate: (db, v){
          // Executa os scripts de criação e inserção inicial.
          db.execute(createTable);
          db.execute(insert1);
          db.execute(insert2);
          db.execute(insert3);
        }, 
        );
      
    }
    return _db; // Retorna a instância do banco de dados.
  }
}