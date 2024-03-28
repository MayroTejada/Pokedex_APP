import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/di_container.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';
import 'package:pokedex_app/features/pokemons/presentation/providers/pokemon_store.dart';

class PokemonDetailPage extends StatefulWidget {
  final int pokemonId;
  const PokemonDetailPage({super.key, required this.pokemonId});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late PokemonStore pokemonStore;
  late Tween<double> tween;
  @override
  void initState() {
    tween = Tween<double>(begin: 0, end: 1);

    pokemonStore = getIt<PokemonStore>()..fetchPokemon(widget.pokemonId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer.withBuiltChild(
        builderWithChild: (_, widget) {
          if (pokemonStore.state.value == PokemonStoreStateEnum.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (pokemonStore.state.value ==
              PokemonStoreStateEnum.loadedList) {
            Pokemon? pokemon = pokemonStore.currentPokemon.value;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  elevation: 4,
                  expandedHeight: MediaQuery.of(context).size.height / 3,
                  floating: true,
                  stretch: true,
                  pinned: true,
                  stretchTriggerOffset: 100,
                  flexibleSpace: FlexibleSpaceBar(
                      background: Center(
                          child: SvgPicture.network(
                        pokemon!.sprites!.first!.sprites.other.dreamWorld
                                .frontDefault ??
                            '',
                        width: 150,
                        height: 150,
                        semanticsLabel: 'A shark?!',
                        placeholderBuilder: (BuildContext context) => Container(
                            padding: const EdgeInsets.all(30.0),
                            child: const CircularProgressIndicator()),
                      )),
                      collapseMode: CollapseMode.pin,
                      expandedTitleScale: 1.1,
                      title: AnimatedOpacity(
                          duration: const Duration(seconds: 1),
                          opacity: 1,
                          child: Text(pokemon.name ?? ''))),
                ),
                SliverFillRemaining(
                  child: Stack(children: [
                    Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(pokemon.pokemonSpecy?.flavorTexts
                                    .firstWhere(
                                        (element) => element.languageId == 7)
                                    .flavorText ??
                                ''),
                          ),
                        )
                      ],
                    ),
                  ]),
                )
              ],
            );
          } else {
            return const Text('ERROR');
          }
        },
        child: const Scaffold(
          body: Center(
            child: Text('data'),
          ),
        ),
      ),
    );
  }
}
