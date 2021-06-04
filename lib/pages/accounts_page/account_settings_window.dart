import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_master/db/models/account_model.dart';

class AccountSettingsWindow extends StatelessWidget {
  AccountSettingsWindow(bool create);
  static TextEditingController _nameController = TextEditingController();
  static TextEditingController _descriptionController = TextEditingController();

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
          //TODO предоставить несколько цветов на выбор (штук десять)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                      context,
                      AccountModel(
                          name: _nameController.text,
                          description: _descriptionController.text));
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
          )
        ],
      ),
    );
  }
}
