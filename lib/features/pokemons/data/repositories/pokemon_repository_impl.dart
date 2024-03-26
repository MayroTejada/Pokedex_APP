import 'package:dartz/dartz.dart';
import 'package:pokedex_app/core/network/failure.dart';
import 'package:pokedex_app/features/pokemons/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';
import 'package:pokedex_app/features/pokemons/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSourceImpl remoteDataSource;

  PokemonRepositoryImpl({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<Pokemon>>> getPokemons() async {
    try {
      var res = await remoteDataSource.getPokemons();
      return Right(res);
    } catch (ex) {
      return const Left(ServerFailure(code: 400, message: "ALGO SALIO MAL"));
    }
  }
}
