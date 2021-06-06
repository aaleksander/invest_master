import 'package:flutter/material.dart';

//TODO Установка пароля

class MyDrawer extends Drawer {
  MyDrawer({Key? key, required BuildContext context})
      : super(
            child: ListView(
          children: [
            SizedBox(
              height: 200,
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dash board'),
              onTap: () {
                print(
                    'go to dash board'); //TODO попробовать сделать навигацию отсюда
              },
            ),
            ListTile(
              leading: Icon(Icons.account_balance_wallet),
              title: Text('Брокерские счета'),
              onTap: () {
                print('go to accounts');
              },
            ),
            ListTile(
              leading: Icon(Icons.assessment),
              title: Text('Статистика'),
              onTap: () {
                print('go to statistica');
              },
            ),
            ListTile(
              leading: Icon(Icons.assistant_photo),
              title: Text('Цели'),
              onTap: () {
                print('go to plan');
              },
            ),
            ListTile(
              //чего купить и сколько в ближайшей перспективе
              leading: Icon(Icons.done),
              title: Text('Чек лист'),
              onTap: () {
                print('go to check list');
              },
            ),
            ListTile(
              //чего купить и сколько в ближайшей перспективе
              leading: Icon(Icons.settings),
              title: Text('Настройки'),
              onTap: () {
                print('go to check list');
              },
            ),
            ListTile(
              //чего купить и сколько в ближайшей перспективе
              leading: Icon(Icons.logout),
              title: Text('Выход'),
              onTap: () {
                print('exit');
              },
            ),
          ],
        ));
}
