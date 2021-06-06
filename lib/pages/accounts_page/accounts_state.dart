import 'package:invest_master/db/models/account_model.dart';
import 'package:invest_master/db/repositories/account_repository.dart';
import 'package:rxdart/rxdart.dart';

class AccountsStateEvent {
  List<AccountModel>? accounts;
  AccountModel? newAccount;
  AccountModel? removeAccount;
  AccountModel? updateAccount;

  AccountsStateEvent(
      {this.accounts, this.newAccount, this.removeAccount, this.updateAccount});
}

class AccountsState {
  late final PublishSubject<AccountsStateEvent> onUpdate;

  List<AccountModel> accounts = [];

  AccountsState() {
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //AccountRepository.inst.removeAll();
    //!!!!!!!!!!!!!!!!!!!!!!!!!!!

    onUpdate = PublishSubject<AccountsStateEvent>();

    AccountRepository.inst.getAll().then((val) {
      print('прочитали: ${val.length}');
      accounts = val;
      onUpdate.add(AccountsStateEvent(accounts: accounts));
    });
  }

  Future newAccount(AccountModel model) async {
    model = await AccountRepository.inst.insert(model);
    accounts.add(model);
    onUpdate.add(AccountsStateEvent(accounts: accounts, newAccount: model));
  }
}
