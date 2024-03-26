import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex_app/di_container.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';
import 'package:pokedex_app/features/pokemons/domain/usecases/get_pokemons.dart';

part 'pokemon_store.g.dart';

@Injectable()
class PokemonStore = _PokemonStoreBase with _$PokemonStore;

abstract class _PokemonStoreBase with Store {
  @observable
  ObservableList<Pokemon> pokemonList = ObservableList();

  @action
  Future<void> fetchPokemons(String params) async {
    final result = await getIt<GetPokemons>().call(GetPokemonsParams());
    result.fold((l) {
      print('error');
    }, (r) {
      pokemonList.addAll(r);
    });
  }
}
