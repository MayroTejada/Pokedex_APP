import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:go_router/go_router.dart';
import 'package:pokedex_app/core/constants.dart';
import 'package:pokedex_app/di_container.dart';
import 'package:pokedex_app/features/pokemons/presentation/components/poke_item_card.dart';
import 'package:pokedex_app/features/pokemons/presentation/providers/pokemon_store.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  late PokemonStore pokemonProvider;
  final GlobalKey<ScaffoldState> scaffoldState =
      GlobalKey<ScaffoldState>(debugLabel: 'scaffold');
  @override
  void initState() {
    pokemonProvider = getIt<PokemonStore>()..fetchPokemons("");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return SafeArea(
          child: Scaffold(
            key: scaffoldState,
            drawer: Drawer(
              child: ListView(
                children: [
                  const DrawerHeader(
                    margin: EdgeInsets.all(10),
                    child: Text('Filtros'),
                  ),
                  ListTile(
                    title: const Text('Region de kanto'),
                    trailing: Checkbox(
                        value: pokemonProvider.isKantoRegion.value,
                        onChanged: (_) => pokemonProvider.setFilterRegion(_)),
                  ),
                  ListTile(
                    title: const Text('Region de johto'),
                    trailing: Checkbox(
                        value: pokemonProvider.isKantoRegion.value,
                        onChanged: (_) => pokemonProvider.setFilterRegion(_)),
                  )
                ],
              ),
            ),
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(
                  Icons.filter_list,
                  color: Colors.white,
                ),
                onPressed: () {
                  scaffoldState.currentState!.openDrawer();
                },
              ),
              title: Text(
                'PokeDex',
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
            ),
            body: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: pokemonProvider.state.value ==
                      PokemonStoreStateEnum.loadedList
                  ? RefreshIndicator(
                      onRefresh: () async =>
                          await pokemonProvider.fetchPokemons(""),
                      child: ListView.builder(
                          padding: const EdgeInsets.all(5),
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (_, index) {
                            var pokemon = pokemonProvider.pokemonList[index];
                            return PokeItemCard(
                              pokemon: pokemon,
                              onCallBack: () {
                                context.push(pokemonDetailPageRoute,
                                    extra: {'pokemon_id': pokemon.id});
                              },
                            );
                          },
                          itemCount: pokemonProvider.pokemonList.length),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ),
        );
      },
    );
  }
}
