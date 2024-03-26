import 'package:graphql_flutter/graphql_flutter.dart' as graph;
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_model.dart';
import 'package:pokedex_app/features/pokemons/data/services/pokemon_graphql.dart';

part 'pokemon_store.g.dart';

@Injectable()
class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  @observable
  ObservableList<PokemonModel> pokemonList = ObservableList();

  @action
  Future<void> fetchPokemons(String params) async {
    final result = await PokemonGraphQlService.client.query(graph.QueryOptions(
      document: graph.gql(PokemonGraphQlService.getPokemonsQuery),
    ));

    if (result.hasException) {
      throw Exception('Failed to fetch pokemons');
    } else {
      pokemonList.clear();
      for (var pokemonData in result.data!['pokemons']) {
        print(result.data!['pokemons']);
      }
    }
  }
}
