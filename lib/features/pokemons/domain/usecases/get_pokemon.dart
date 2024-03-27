import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/core/network/failure.dart';
import 'package:pokedex_app/core/usecases/usecase.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon_detail.dart';
import 'package:pokedex_app/features/pokemons/domain/repositories/pokemon_repository.dart';

@singleton
class GetPokemon extends UseCase<PokemonDetail, GetPokemonParams> {
  final PokemonRepository repository;

  GetPokemon({required this.repository});
  @override
  Future<Either<Failure, PokemonDetail>> call(GetPokemonParams params) {
    return repository.getPokemon(params.queries);
  }
}

class GetPokemonParams extends Equatable {
  final QueryOptions queries;

  const GetPokemonParams({required this.queries});
  @override
  List<Object?> get props => [queries];
}
