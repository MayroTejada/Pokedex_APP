import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';

class PokeItemHero extends StatelessWidget {
  final Pokemon pokemon;
  const PokeItemHero({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Hero(
      transitionOnUserGestures: true,
      tag: pokemon.name,
      child: Material(
        color: Colors.white,
        elevation: 3,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        child: ListTile(
          trailing: Text(pokemon.id.toString()),
          title: Text(pokemon.name),
        ),
      ),
    );
  }
}
