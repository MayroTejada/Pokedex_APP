import 'package:flutter/material.dart';
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
    return const Scaffold(
      body: Center(
        child: Text('data'),
      ),
    );
  }
}
