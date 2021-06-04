import 'package:flutter/material.dart';
import 'package:invest_master/db/models/base_model.dart';

class AccountModel extends BaseModel {
  int id = 0;
  late String name;
  String? description;
  late Color color;

  AccountModel(
      {this.id = 0, required this.name, this.description, String? color}) {
    this.color = string2Color(color);
  }

  @override
  factory AccountModel.fromMap(Map<String, dynamic> row) {
    return AccountModel(
      id: row["id"],
      name: row["name"],
      description: row['desc'],
      color: row['color'],
    );
  }

  @override
  Map<String, dynamic> toMap() {
    var c = color2String(color);
    return {
      "id": id,
      "name": name,
      'desc': description,
      'color': c,
    };
  }
}
