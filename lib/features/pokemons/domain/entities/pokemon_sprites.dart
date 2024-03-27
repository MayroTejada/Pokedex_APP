import 'package:equatable/equatable.dart';

class PokemonSprites extends Equatable {
  final PokemonSpriteOther other;

  const PokemonSprites({required this.other});
  @override
  List<Object?> get props => [other];
}

class PokemonSpriteOther extends Equatable {
  final PokemonSpriteDreamWorld dreamWorld;

  const PokemonSpriteOther({required this.dreamWorld});
  @override
  List<Object?> get props => [dreamWorld];
}

class PokemonSpriteDreamWorld extends Equatable {
  final String frontDefault;

  const PokemonSpriteDreamWorld({required this.frontDefault});
  @override
  List<Object?> get props => [frontDefault];
}
