import 'dart:io';

import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider _inst = DBProvider._();
  static Database? _database;

  static Future<Database> get db => _inst.database;

  Future<Database> get database async {
    if (_database != null) {
      print('база уже открыта');
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    print('initDB');
    Directory dir = await getApplicationDocumentsDirectory();
    var path = join(dir.path, 'database.db');

    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onUpgrade: _onUpgrade,
      onCreate: _onCreate,
    );
  }

  void _onCreate(Database db, int version) async {
    print('создаем бд');
    await db.execute(_sql_accounts);
  }

  void _onUpgrade(Database db, int oldVersion, int newVersion) async {
    print('апдейтим бд $oldVersion -> $newVersion');
    // if (oldVersion == 1 && newVersion == 2) {
    //   await db.execute(_sql_itemList);
    // }
  }

  static const String _sql_accounts = 'CREATE TABLE accounts ('
      'id INTEGER PRIMARY KEY, ' //идентификатор
      'name TEXT, ' //название счета
      'desc TEXT, ' //описание счета
      'color TEXT' //цвет (для визуализации и статистики)
      ')';
}
