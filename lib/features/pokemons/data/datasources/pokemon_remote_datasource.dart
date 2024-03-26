import 'package:pokedex_app/features/pokemons/data/models/pokemon_model.dart';

abstract class PokemonRemoteDataSource {
  Future<List<PokemonModel>> getPokemons();
}

class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final PokemonRemoteDataSourceImpl remoteDataSource;

  PokemonRemoteDataSourceImpl({required this.remoteDataSource});
  @override
  Future<List<PokemonModel>> getPokemons() async {
    return remoteDataSource.getPokemons();
  }
}
