import 'package:dio/dio.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/core/network/app_cofig.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_list_response_model.dart';
import 'package:pokedex_app/features/pokemons/data/services/pokemon_graphql.dart';
import 'package:pokedex_app/features/pokemons/data/services/pokemon_service.dart';

abstract class PokemonRemoteDataSource {
  Future<QueryResult> getPokemons();
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
  Future<QueryResult> getPokemons() async {
    return service2.client.query<PokemonListResponseModel>(
        QueryOptions(document: gql(PokemonGraphQlService.getPokemonsQuery)));
  }
}
