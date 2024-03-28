import 'package:equatable/equatable.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon_sprites.dart';

class PokemonSpriteResult extends Equatable {
  final PokemonSprites sprites;

  const PokemonSpriteResult({required this.sprites});
  @override
  List<Object?> get props => [sprites];
}
