import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/core/network/failure.dart';
import 'package:pokedex_app/core/usecases/usecase.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';
import 'package:pokedex_app/features/pokemons/domain/repositories/pokemon_repository.dart';
@singleton
class GetPokemons extends UseCase<List<Pokemon>, GetPokemonsParams> {
  final PokemonRepository repository;

  GetPokemons({required this.repository});
  @override
  Future<Either<Failure, List<Pokemon>>> call(GetPokemonsParams params) {
    return repository.getPokemons();
  }
}

class GetPokemonsParams extends Equatable {
  @override
  List<Object?> get props => [];
}
