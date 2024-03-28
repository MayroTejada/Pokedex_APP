import 'package:equatable/equatable.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/flavor_text.dart';

class PokemonSpecy extends Equatable {
  final List<FlavorText> flavorTexts;

  const PokemonSpecy({required this.flavorTexts});

  @override
  List<Object?> get props => [flavorTexts];
}
