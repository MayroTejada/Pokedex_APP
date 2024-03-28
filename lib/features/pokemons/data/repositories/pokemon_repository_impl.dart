import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/core/network/failure.dart';
import 'package:pokedex_app/features/pokemons/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_detail_model.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_list_response_model.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_model.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon_detail.dart';
import 'package:pokedex_app/features/pokemons/domain/repositories/pokemon_repository.dart';

@Injectable(as: PokemonRepository)
class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons(
      QueryOptions queries) async {
    try {
      var res = await remoteDataSource.getPokemons(queries);
      if (res.data != null) {
        return Right(
            PokemonListResponseModel.fromJson(res.data!).pokemonSpecies);
      } else {
        return const Left(ServerFailure(code: 200, message: 'empty list'));
      }
    } on Exception catch (ex) {
      return Left(ServerFailure(code: 400, message: ex.toString()));
    }
  }

  @override
  Future<Either<Failure, Pokemon>> getPokemon(
      QueryOptions<Object?> queries) async {
    try {
      var res = await remoteDataSource.getPokemon(queries);
      if (res.data != null) {
        List resultListPokemons = res.data!['pokemon'] as List;
        return Right(PokemonModel.fromJson(
            resultListPokemons.first as Map<String, dynamic>));
      } else {
        return const Left(ServerFailure(code: 200, message: 'empty list'));
      }
    } on Exception catch (ex) {
      return Left(ServerFailure(code: 400, message: ex.toString()));
    }
  }
}
