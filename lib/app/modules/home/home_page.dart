import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homeController = Modular.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Observer(builder: (_) {
        if (homeController.pokemons?.value == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (homeController.pokemons?.error != null) {
          return Center(
            child: Text('Error'),
          );
        }

        var list = homeController.pokemons?.value;
        return ListView.builder(
            itemCount: list?.length,
            itemBuilder: (_, index) {
              return ListTile(
                title: Text(list?[index].name ?? index.toString()),
              );
            });
      }),
    );
  }
}
