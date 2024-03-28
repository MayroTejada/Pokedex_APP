import 'package:equatable/equatable.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon_specy.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon_sprite_result.dart';

class Pokemon extends Equatable {
  final String name;
  final int id;
  final List<PokemonSpriteResult?>? sprites;
  final PokemonSpecy? pokemonSpecy;
  const Pokemon(
      {required this.id,
      required this.name,
      required this.sprites,
      required this.pokemonSpecy});
  @override
  List<Object?> get props => [name, id, sprites, pokemonSpecy];
}
