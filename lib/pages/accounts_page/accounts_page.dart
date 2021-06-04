import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:invest_master/db/models/account_model.dart';
import 'package:invest_master/drawer.dart';
import 'package:invest_master/misc/stream_builder_with_listener.dart';
import 'package:invest_master/pages/accounts_page/account_settings_window.dart';
import 'package:invest_master/pages/accounts_page/accounts_state.dart';

enum AcountsPageActions { add, remove }

class AccountsPage extends StatelessWidget {
  late final TabController _tabController;
  late final AccountsState _state;

  AccountsPage() {
    _state = AccountsState();
  }

  @override
  build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Брокерские счета'),
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
                    title: Text(item.name),
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
                      builder: (context) => AccountSettingsWindow(true)))
              .then((value) {
            if (value == null) return;
            var model = value as AccountModel;
            print('add new account: ${value.id} ${value.name}');
            _state.newAccount(model);
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
