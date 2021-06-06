import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_master/db/models/account_model.dart';
import 'package:invest_master/drawer.dart';
import 'package:invest_master/misc/stream_builder_with_listener.dart';
import 'package:invest_master/pages/accounts_page/account_settings_window.dart';
import 'package:invest_master/pages/accounts_page/accounts_state.dart';

enum AcountsPageActions { add, remove }

class AccountsPage extends StatelessWidget {
  late final AccountsState _state;

  AccountsPage() {
    _state = AccountsState();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Брокерские счета'),
        actions: [
          ElevatedButton(
            child: Icon(Icons.refresh),
            onPressed: () {
              print('обновляем данные');
            },
          )
        ],
      ),
      body: StreamBuilderWithListener<AccountsStateEvent>(
        initialData: AccountsStateEvent(accounts: _state.accounts),
        stream: _state.onUpdate,
        listener: (state) {
          print('listener: ${state.newAccount?.name}');
        },
        builder: (context, state) {
          var ss = state.data as AccountsStateEvent;
          print(ss.accounts?.length);
          if (ss.accounts != null) {
            return ListView.builder(
                itemCount: ss.accounts?.length, //TODO добавить "итого"
                itemBuilder: (context, index) {
                  final item = ss.accounts![index];
                  return ListTile(
                    onTap: () {
                      print('переходим в портфель "${item.name}"');
                    },
                    onLongPress: () {
                      //TODO меню с пунктами "редактировать", "удалить", "пересчитать"
                    },
                    contentPadding: EdgeInsets.only(left: 10, right: 10),
                    title: Row(
                      children: [
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: Container(color: item.color),
                        ),
                        SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            item.name,
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        Text(
                          '1 234 222.78',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  );
                });
          } else
            return Text('пусто');
        },
      ),
      drawer: MyDrawer(context: context),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AccountSettingsWindow())).then((value) {
            if (value == null) return;
            var model = value as AccountModel;
            print('add new account: ${value.id} ${value.name}, ${value.color}');
            _state.newAccount(model);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
