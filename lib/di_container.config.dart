// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'core/network/app_cofig.dart' as _i3;
import 'core/network/dio_provider.dart' as _i11;
import 'features/pokemons/data/datasources/pokemon_remote_datasource.dart'
    as _i6;
import 'features/pokemons/data/repositories/pokemon_repository_impl.dart'
    as _i8;
import 'features/pokemons/data/services/pokemon_service.dart' as _i9;
import 'features/pokemons/domain/repositories/pokemon_repository.dart' as _i7;
import 'features/pokemons/domain/usecases/get_pokemons.dart' as _i10;
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
    gh.factory<_i3.IConfig>(() => _i3.AppConfig());
    gh.factory<_i4.PokemonStore>(() => _i4.PokemonStore());
    gh.singleton<_i5.Dio>(() => dioProvider.dio(gh<_i3.IConfig>()));
    gh.factory<_i6.PokemonRemoteDataSource>(
        () => _i6.PokemonRemoteDataSourceImpl(
              dio: gh<_i5.Dio>(),
              config: gh<_i3.IConfig>(),
            ));
    gh.factory<_i7.PokemonRepository>(() => _i8.PokemonRepositoryImpl(
        remoteDataSource: gh<_i6.PokemonRemoteDataSource>()));
    gh.factory<_i9.PokemonService>(() => _i9.PokemonService(
          gh<_i5.Dio>(),
          baseUrl: gh<String>(),
        ));
    gh.singleton<_i10.GetPokemons>(
        () => _i10.GetPokemons(repository: gh<_i7.PokemonRepository>()));
    return this;
  }
}

class _$DioProvider extends _i11.DioProvider {}
