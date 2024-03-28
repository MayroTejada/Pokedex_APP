import 'package:graphql_flutter/graphql_flutter.dart' as graphQL;
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_app/di_container.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';
import 'package:pokedex_app/features/pokemons/domain/usecases/get_pokemon.dart';
import 'package:pokedex_app/features/pokemons/domain/usecases/get_pokemons.dart';

part 'pokemon_store.g.dart';

@Injectable()
class PokemonStore = _PokemonStoreBase with _$PokemonStore;

enum PokemonStoreStateEnum { none, loadedList, failed, loading }

abstract class _PokemonStoreBase with Store {
  @observable
  Observable<Pokemon?> currentPokemon = Observable<Pokemon?>(null);
  @observable
  Observable<List<Pokemon>> pokemonList = Observable([]);
  @observable
  Observable<int> regionId = Observable<int>(1);
  @observable
  Observable<bool> isKanto = Observable(false);
  @observable
  Observable<bool> isJotho = Observable(false);
  @observable
  Observable<PokemonStoreStateEnum> state =
      Observable(PokemonStoreStateEnum.none);
  @action
  void setFilterRegion(int regionsId) {
    if (regionsId == 1) {
      isKanto.value = true;
      isJotho.value = false;
    } else {
      isKanto.value = false;
      isJotho.value = true;
    }
    regionId.value = regionsId;
    fetchPokemons();
  }

  @action
  Future<void> fetchPokemons() async {
    state.value = PokemonStoreStateEnum.loading;
    int region = regionId.value;
    final result = await getIt<GetPokemons>().call(GetPokemonsParams(
        queries: graphQL.QueryOptions(document: graphQL.gql("""
   query GetPokemonsByRegionIQuery {
    pokemon_species :pokemon_v2_pokemonspecies(where: {generation_id: {_eq: $region}}) {
      id
      name
    }
  }
  """))));
    result.fold((l) {
      print('error');
    }, (list) {
      state.value = PokemonStoreStateEnum.loadedList;
      pokemonList.value = list;
    });
  }

  @action
  Future<void> fetchPokemon(int pokemonId) async {
    state.value = PokemonStoreStateEnum.loading;

    final result = await getIt<GetPokemon>().call(
        GetPokemonParams(queries: graphQL.QueryOptions(document: graphQL.gql("""
query GetPokemonGod{
  pokemon: pokemon_v2_pokemon(where:{pokemon_species_id:{_eq:$pokemonId}}){
      name
      id
   sprites:pokemon_v2_pokemonsprites{
      sprites
  	}
     pokemon_specy:pokemon_v2_pokemonspecy{
      id
      flavor_texts:pokemon_v2_pokemonspeciesflavortexts{
          language_id
          flavor_text
        
      }
    }
    }
}
          """))));
    result.fold((l) {}, (pokemon) {
      state.value = PokemonStoreStateEnum.loadedList;
      currentPokemon.value = pokemon;
    });
  }
}
