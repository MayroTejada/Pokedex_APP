import 'package:equatable/equatable.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon_sprites.dart';

class PokemonDetail extends Equatable {
  final Pokemon? pokemon;
  final PokemonSprites? sprites;

  const PokemonDetail({this.pokemon, this.sprites});
  @override
  List<Object?> get props => [pokemon, sprites];
}
