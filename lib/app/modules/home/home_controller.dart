import 'package:mobx/mobx.dart';
import 'package:slidy_demo/app/modules/home/repositories/poke_repository.dart';

import 'models/pokemon_model.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final PokeRepository repository;

  @observable
  ObservableFuture<List<PokemonModel>>? pokemons;

  _HomeControllerBase(this.repository) {
    pokemons = repository.getAllPokemons().asObservable();
  }
}
