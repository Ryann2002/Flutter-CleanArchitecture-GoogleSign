import 'package:slidy_demo/app/shared/auth/auth_store.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:slidy_demo/app/modules/login/login_module.dart';
import 'package:slidy_demo/app/pages/splash_page.dart';
import 'package:slidy_demo/shared/utils.dart/constants.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind((i) => Dio(BaseOptions(baseUrl: URL_BASE)))];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => SplashPage()),
    ModuleRoute('/home', module: HomeModule()),
    ModuleRoute('/login', module: LoginModule()),
  ];
}
