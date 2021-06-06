import 'package:flutter/material.dart';

Color string2Color(String? color) {
  final res = color != null
      ? Color(int.parse(color.substring(3), radix: 16) + 0xFF000000)
      : Color(0xFF606060);

  print('string2Color: $color -> $res');

  return res;
}

String color2String(Color color) {
  final res = '#${color.value.toRadixString(16)}';
  print('color2String: $color -> $res');
  return res;
}

class BaseModel {
  BaseModel();

  factory BaseModel.fromMap(Map<String, dynamic> row) {
    throw Exception('нельзя вызывать это');
  }

  Map<String, dynamic> toMap() => {};
}
