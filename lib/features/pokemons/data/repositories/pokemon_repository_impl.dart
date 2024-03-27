import 'package:dartz/dartz.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/core/network/failure.dart';
import 'package:pokedex_app/features/pokemons/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_list_response_model.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';
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
    } on GraphQLError catch (ex) {
      return Left(ServerFailure(code: 400, message: ex.toString()));
    }
  }
}
