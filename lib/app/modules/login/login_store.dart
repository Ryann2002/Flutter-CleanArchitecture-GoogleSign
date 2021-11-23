import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidy_demo/app/shared/auth/auth_store.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  final AuthController _auth = Modular.get();
  @observable
  bool loading = false;

  @action
  Future loginWithGoogle() async {
    try {
      loading = true;
      await _auth.loginWithGoogle();
      Modular.to.pushReplacementNamed('/home/');
    } catch (e) {
      loading = false;
    }
  }
}
