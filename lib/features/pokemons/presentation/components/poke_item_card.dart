import 'package:flutter/material.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';

class PokeItemCard extends StatelessWidget {
  final Pokemon pokemon;
  final Function() onCallBack;
  final EdgeInsets? padding;
  final Size? size;
  const PokeItemCard(
      {super.key,
      this.padding,
      this.size,
      required this.pokemon,
      required this.onCallBack});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onCallBack,
      child: Padding(
          padding: padding ?? const EdgeInsets.all(8),
          child: Material(
            elevation: 5,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: SizedBox(
              height: size?.height ?? 55,
              child: Hero(
                tag: pokemon.name,
                child: Material(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ListTile(
                    trailing: Text(pokemon.id.toString()),
                    leading: const Icon(Icons.catching_pokemon),
                    title: Text(pokemon.name),
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
