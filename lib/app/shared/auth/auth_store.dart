import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:slidy_demo/app/shared/auth/repositories/auth-repository.dart';
import 'package:slidy_demo/app/shared/auth/repositories/auth_repository_interface.dart';
part 'auth_store.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final IAuthRepository _authRepository = Modular.get();

  @observable
  User? user;

  @action
  setUser(User value) => user = value;

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser);
  }

  @action
  Future loginWithGoogle() async {
    user = await _authRepository.getGoogleSignIn();
  }
}
