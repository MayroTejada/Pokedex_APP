import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pokedex_app/di_container.dart';
import 'package:pokedex_app/features/pokemons/presentation/providers/pokemon_store.dart';

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
    return Scaffold(
      body: Observer.withBuiltChild(
        builderWithChild: (_, widget) {
          if (pokemonStore.state.value == PokemonStoreStateEnum.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (pokemonStore.state.value ==
              PokemonStoreStateEnum.loadedList) {
            var pokemonDetail = pokemonStore.currentPokemon.value;
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
                        pokemonDetail!.sprites?.other.dreamWorld.frontDefault ??
                            '',
                        width: 150,
                        height: 150,
                        semanticsLabel: 'A shark?!',
                        placeholderBuilder: (BuildContext context) => Container(
                            padding: const EdgeInsets.all(30.0),
                            child: const CircularProgressIndicator()),
                      )),
                      collapseMode: CollapseMode.pin,
                      expandedTitleScale: 1.3,
                      title: Text(pokemonDetail.pokemon?.name ?? '')),
                ),
                SliverFillRemaining(
                  child: Stack(children: [
                    Column(
                      children: [Text(pokemonDetail.pokemon?.name ?? '')],
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
