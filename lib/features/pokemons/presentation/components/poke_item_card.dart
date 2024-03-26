import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';

class PokeItemCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokeItemCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        elevation: 5,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: SizedBox(
            height: 60,
            child: ListTile(
              trailing: Text(pokemon.id.toString()),
              leading: const Icon(Icons.catching_pokemon),
              title: Text(pokemon.name),
            )),
      ),
    );
  }
}
