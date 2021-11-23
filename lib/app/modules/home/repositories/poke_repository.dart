import 'package:dio/dio.dart';
import 'package:slidy_demo/app/modules/home/models/pokemon_model.dart';

class PokeRepository {
  final Dio dio;

  PokeRepository(this.dio);

  Future<List<PokemonModel>> getAllPokemons() async {
    Response response = await dio.get("/pokemon");
    List<PokemonModel> list = [];

    for (var item in (response.data['results'] as List)) {
      PokemonModel model = PokemonModel(item['name']);
      list.add(model);
    }

    return list;
  }
}
