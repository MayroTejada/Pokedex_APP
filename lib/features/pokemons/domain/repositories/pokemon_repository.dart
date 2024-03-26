import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/network/failure.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Failure, List<Pokemon>>> getPokemons();
}
