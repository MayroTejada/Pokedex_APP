import 'package:dio/dio.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/core/network/app_cofig.dart';
import 'package:pokedex_app/features/pokemons/data/services/pokemon_graphql.dart';
import 'package:pokedex_app/features/pokemons/data/services/pokemon_service.dart';

abstract class PokemonRemoteDataSource {
  Future<QueryResult> getPokemons(QueryOptions queryOptions);
  Future<QueryResult> getPokemon(QueryOptions queryOptions);
}

@Injectable(as: PokemonRemoteDataSource)
class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;
  final IConfig config;
  final PokemonService service;
  final PokemonGraphQlService service2;

  PokemonRemoteDataSourceImpl(
      {required this.dio, required this.service2, required this.config})
      : service = PokemonService(dio, baseUrl: config.baseUrl);
  @override
  Future<QueryResult> getPokemons(QueryOptions queryOptions) async {
    return service2.client.query(queryOptions);
  }

  @override
  Future<QueryResult> getPokemon(QueryOptions<Object?> queryOptions) {
    return service2.client.query(queryOptions);
  }
}
