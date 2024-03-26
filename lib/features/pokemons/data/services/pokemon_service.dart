import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_list_response_model.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_service.g.dart';

@injectable
@RestApi(baseUrl: "config")
abstract class PokemonService {
  @factoryMethod
  factory PokemonService(Dio dio, {String baseUrl}) = _PokemonService;

  @GET('/generation/1')
  Future<PokemonListResponseModel> getPokemons();
}
