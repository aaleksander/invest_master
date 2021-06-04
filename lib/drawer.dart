import 'package:flutter/material.dart';

class MyDrawer extends Drawer {
  MyDrawer({Key? key, required BuildContext context})
      : super(
            child: ListView(
          children: [
            SizedBox(
              height: 200,
            ),
            ListTile(
              //TODO добавить иконки на каждый пункт
              title: Text('Dash board'),
              onTap: () {
                print(
                    'go to dash board'); //TODO попробовать сделать навигацию отсюда
              },
            ),
            ListTile(
              title: Text('Брокерские счета'),
              onTap: () {
                print('go to accounts');
              },
            ),
            ListTile(
              title: Text('Статистика'),
              onTap: () {
                print('go to statistica');
              },
            ),
            ListTile(
              title: Text('Цели'),
              onTap: () {
                print('go to plan');
              },
            ),
            ListTile(
              //чего купить и сколько в ближайшей перспективе
              title: Text('Чек лист'),
              onTap: () {
                print('go to check list');
              },
            ),
          ],
        ));
}
