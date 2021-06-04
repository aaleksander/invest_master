import 'package:flutter/material.dart';

Color string2Color(String? color) => color != null
    ? Color(int.parse(color.substring(1, 7), radix: 16) + 0xFF000000)
    : Color(0xFF606060);

String color2String(Color color) => '#${color.value.toRadixString(16)}';

class BaseModel {
  BaseModel();

  factory BaseModel.fromMap(Map<String, dynamic> row) {
    throw Exception('нельзя вызывать это');
  }

  Map<String, dynamic> toMap() => {};
}
