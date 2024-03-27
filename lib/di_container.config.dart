// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:graphql_flutter/graphql_flutter.dart' as _i6;
import 'package:injectable/injectable.dart' as _i2;

import 'core/network/app_cofig.dart' as _i3;
import 'core/network/dio_provider.dart' as _i14;
import 'core/network/graph_provider.dart' as _i15;
import 'features/pokemons/data/datasources/pokemon_remote_datasource.dart'
    as _i8;
import 'features/pokemons/data/repositories/pokemon_repository_impl.dart'
    as _i10;
import 'features/pokemons/data/services/pokemon_graphql.dart' as _i7;
import 'features/pokemons/data/services/pokemon_service.dart' as _i11;
import 'features/pokemons/domain/repositories/pokemon_repository.dart' as _i9;
import 'features/pokemons/domain/usecases/get_pokemon.dart' as _i12;
import 'features/pokemons/domain/usecases/get_pokemons.dart' as _i13;
import 'features/pokemons/presentation/providers/pokemon_store.dart' as _i4;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioProvider = _$DioProvider();
    final graphProvider = _$GraphProvider();
    gh.factory<_i3.IConfig>(() => _i3.AppConfig());
    gh.factory<_i4.PokemonStore>(() => _i4.PokemonStore());
    gh.singleton<_i5.Dio>(() => dioProvider.dio(gh<_i3.IConfig>()));
    gh.singleton<_i6.GraphQLClient>(
        () => graphProvider.graphQL(gh<_i3.IConfig>()));
    gh.factory<_i7.PokemonGraphQlService>(
        () => _i7.PokemonGraphQlService(client: gh<_i6.GraphQLClient>()));
    gh.factory<_i8.PokemonRemoteDataSource>(
        () => _i8.PokemonRemoteDataSourceImpl(
              dio: gh<_i5.Dio>(),
              service2: gh<_i7.PokemonGraphQlService>(),
              config: gh<_i3.IConfig>(),
            ));
    gh.factory<_i9.PokemonRepository>(() => _i10.PokemonRepositoryImpl(
        remoteDataSource: gh<_i8.PokemonRemoteDataSource>()));
    gh.factory<_i11.PokemonService>(() => _i11.PokemonService(
          gh<_i5.Dio>(),
          baseUrl: gh<String>(),
        ));
    gh.singleton<_i12.GetPokemon>(
        () => _i12.GetPokemon(repository: gh<_i9.PokemonRepository>()));
    gh.singleton<_i13.GetPokemons>(
        () => _i13.GetPokemons(repository: gh<_i9.PokemonRepository>()));
    return this;
  }
}

class _$DioProvider extends _i14.DioProvider {}

class _$GraphProvider extends _i15.GraphProvider {}
