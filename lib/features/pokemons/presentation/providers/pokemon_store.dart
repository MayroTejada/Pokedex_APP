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

enum PokemonStoreStateEnum { none, loadedList, failed, loading }

abstract class _PokemonStoreBase with Store {
  @observable
  ObservableList<Pokemon> pokemonList = ObservableList();
  @observable
  Observable<bool> isKantoRegion = Observable(false);
  @observable
  Observable<String> filters =
      Observable(PokemonGraphQlService.getPokemonsQuery);
  @observable
  Observable<PokemonStoreStateEnum> state =
      Observable(PokemonStoreStateEnum.none);
  @action
  void setFilterRegion(bool? value) {
    isKantoRegion.value = value ?? false;
  }

  @action
  Future<void> fetchPokemons(String params) async {
    state.value = PokemonStoreStateEnum.loading;

    final result = await getIt<GetPokemons>()
        .call(GetPokemonsParams(queries: queryOptions));
    result.fold((l) {
      print('error');
    }, (list) {
      state.value = PokemonStoreStateEnum.loadedList;
      pokemonList.addAll(list);
    });
  }

  graphQL.QueryOptions setQueries() {
    int generationId = 2;
    if (isKantoRegion.value) {
      generationId = 1;
    }
    return graphQL.QueryOptions(
      document: graphQL.gql(PokemonGraphQlService.getPokemonsQuery),
    );
  }

  @computed
  graphQL.QueryOptions get queryOptions => setQueries();
}
