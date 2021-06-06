import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:invest_master/db/models/account_model.dart';
import 'package:invest_master/db/models/base_model.dart';

class AccountSettingsWindow extends StatelessWidget {
  AccountSettingsWindow({AccountModel? model}) {
    if (model == null) {
      print('новый счет');
      _nameController.text = '';
      _descriptionController.text = '';
    } else {
      print('редактируем');
      _nameController.text = model.name;
      _descriptionController.text =
          model.description == null ? '' : model.description!;
    }
  }
  static TextEditingController _nameController = TextEditingController();
  static TextEditingController _descriptionController = TextEditingController();
  static Color color = Colors.red;

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Создаем новый счет'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Название',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Примечание',
              ),
            ),
          ),
          Text('Выберите цвет:'),
          Expanded(
            child: BlockPicker(
              pickerColor: color,
              onColorChanged: (val) {
                print(val);
                color = val;
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(
                        context,
                        AccountModel(
                            name: _nameController.text,
                            description: _descriptionController.text,
                            color: color2String(color)));
                  },
                  child: Text('OK'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  child: Text('Отмена'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
