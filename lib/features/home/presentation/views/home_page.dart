import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:pokedex_app/di_container.dart';
import 'package:pokedex_app/features/pokemons/presentation/components/poke_item_card.dart';
import 'package:pokedex_app/features/pokemons/presentation/providers/pokemon_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            drawer: const Drawer(
              child: Column(
                children: [Text('ALGO')],
              ),
            ),
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  scaffoldState.currentState!.openDrawer();
                },
              ),
              title: Text(
                'PokeDex',
                style: Theme.of(context).textTheme.bodyMedium,
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
                            return PokeItemCard(
                                pokemon: pokemonProvider.pokemonList[index]);
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
