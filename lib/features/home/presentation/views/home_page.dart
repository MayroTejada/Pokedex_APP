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
  @override
  void initState() {
    pokemonProvider = getIt<PokemonStore>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
            ),
            title: Text(
              'PokeDex',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 300,
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return PokeItemCard(
                              pokemon: pokemonProvider.pokemonList[index]);
                        },
                        itemCount: pokemonProvider.pokemonList.length),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            pokemonProvider.fetchPokemons('');
                          },
                          child: const Text('llamar pokemons')),
                    ],
                  ),
                ]),
          ),
        );
      },
    );
  }
}
