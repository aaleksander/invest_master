import 'package:flutter/material.dart';
import 'package:invest_master/db/db_provider.dart';
import 'package:invest_master/db/models/account_model.dart';
import 'package:invest_master/db/models/base_model.dart';
import 'package:invest_master/db/repositories/base_repository.dart';

class AccountRepository extends BaseRepository<AccountModel> {
  AccountRepository._() : super(tableName: 'accounts');
  static final AccountRepository inst = AccountRepository._();

  Future<List<AccountModel>> getAll() async {
    final db = await DBProvider.db;
    var res = await db.query(tableName);
    List<AccountModel> list =
        res.isNotEmpty ? res.map((x) => AccountModel.fromMap(x)).toList() : [];
    return list;
  }

  Future<AccountModel> insert(AccountModel model) async {
    final db = await DBProvider.db;

    model.id = await getNewId();
    print('new id = ${model.id}');

    await db.rawInsert(
        'INSERT INTO $tableName (id, name, desc, color)'
        ' values(?, ?, ?, ?)',
        [model.id, model.name, model.description, color2String(Colors.blue)]);

    return model;
  }
}
