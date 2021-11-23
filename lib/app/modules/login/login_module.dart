import 'package:slidy_demo/app/modules/login/login_Page.dart';
import 'package:slidy_demo/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_demo/app/shared/auth/auth_store.dart';
import 'package:slidy_demo/app/shared/auth/repositories/auth-repository.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => AuthController()),
    Bind((i) => AuthRepository()),
    Bind.lazySingleton((i) => LoginStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
