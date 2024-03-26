import 'package:dio/dio.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_model.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_service.g.dart';

@RestApi(baseUrl: 'https://pokeapi.co/api/v2')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET('/generation/1')
  Future<List<PokemonModel>> getPokemons();
}
