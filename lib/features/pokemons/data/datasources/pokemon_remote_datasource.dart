import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pokedex_app/core/network/app_cofig.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_list_response_model.dart';
import 'package:pokedex_app/features/pokemons/data/services/pokemon_service.dart';

abstract class PokemonRemoteDataSource {
  Future<PokemonListResponseModel> getPokemons();
}

@Injectable(as: PokemonRemoteDataSource)
class PokemonRemoteDataSourceImpl implements PokemonRemoteDataSource {
  final Dio dio;
  final IConfig config;
  final PokemonService service;

  PokemonRemoteDataSourceImpl({required this.dio, required this.config})
      : service = PokemonService(dio, baseUrl: config.baseUrl);
  @override
  Future<PokemonListResponseModel> getPokemons() async {
    throw UnimplementedError();
  }
}
