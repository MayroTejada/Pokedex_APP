import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pokedex_app/core/network/failure.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon_detail.dart';

abstract class PokemonRepository {
  Future<Either<Failure, PokemonDetail>> getPokemon(QueryOptions queries);
  Future<Either<Failure, List<Pokemon>>> getPokemons(QueryOptions queries);
}
