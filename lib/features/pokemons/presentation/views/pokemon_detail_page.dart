import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/di_container.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';
import 'package:pokedex_app/features/pokemons/presentation/providers/pokemon_store.dart';

import '../components/poke_title_hero.dart';

class PokemonDetailPage extends StatefulWidget {
  final int pokemonId;
  const PokemonDetailPage({super.key, required this.pokemonId});

  @override
  State<PokemonDetailPage> createState() => _PokemonDetailPageState();
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  late PokemonStore pokemonStore;

  @override
  void initState() {
    pokemonStore = getIt<PokemonStore>()..fetchPokemon(widget.pokemonId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                      expandedHeight: 300,
                      stretch: true,
                      toolbarHeight: 85,
                      pinned: true,
                      stretchTriggerOffset: 100,
                      flexibleSpace: FlexibleSpaceBar(
                          background: Center(
                              child: SvgPicture.network(
                            fit: BoxFit.cover,
                            pokemon!.sprites!.first!.sprites.other.dreamWorld
                                    .frontDefault ??
                                '',
                            width: 140,
                            height: 140,
                            semanticsLabel: pokemon.sprites!.first!.sprites
                                .other.dreamWorld.frontDefault,
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(30.0),
                                    child: const CircularProgressIndicator()),
                          )),
                          expandedTitleScale: 1.0,
                          title: PokeItemHero(
                            pokemon: pokemon,
                          ))),
                  SliverFillRemaining(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              animatedTexts: [
                                TypewriterAnimatedText(
                                    textAlign: TextAlign.start,
                                    curve: Curves.linearToEaseOut,
                                    pokemon.pokemonSpecy?.flavorTexts
                                            .firstWhere((element) =>
                                                element.languageId == 7)
                                            .flavorText ??
                                        '',
                                    speed: const Duration(milliseconds: 100)),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
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
      ),
    );
  }
}
