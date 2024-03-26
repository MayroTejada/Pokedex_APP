import 'package:graphql_flutter/graphql_flutter.dart' as graphQL;
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_app/di_container.dart';
import 'package:pokedex_app/features/pokemons/data/services/pokemon_graphql.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';
import 'package:pokedex_app/features/pokemons/domain/usecases/get_pokemons.dart';

part 'pokemon_store.g.dart';

@Injectable()
class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  @observable
  ObservableList<Pokemon> pokemonList = ObservableList();
  @observable
  Observable<String> filters =
      Observable(PokemonGraphQlService.getPokemonsQuery);
  @action
  Future<void> fetchPokemons(String params) async {
    final result = await getIt<GetPokemons>().call(GetPokemonsParams(
        queries: graphQL.QueryOptions(document: graphQL.gql(filters.value))));
    result.fold((l) {
      print('error');
    }, (r) {
      pokemonList.addAll(r);
    });
  }
}
