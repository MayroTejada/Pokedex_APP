import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon_sprites.dart';

part 'pokemon_sprites_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PokemonSpritesModel extends PokemonSprites {
  @override
  final PokemonSpriteOtherModel other;
  const PokemonSpritesModel({required this.other}) : super(other: other);
  factory PokemonSpritesModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpritesModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpritesModelToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PokemonSpriteOtherModel extends PokemonSpriteOther {
  @override
  final PokemonSpriteDreamWorldModel dreamWorld;
  factory PokemonSpriteOtherModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpriteOtherModelFromJson(json);

  const PokemonSpriteOtherModel({required this.dreamWorld})
      : super(dreamWorld: dreamWorld);
  Map<String, dynamic> toJson() => _$PokemonSpriteOtherModelToJson(this);
}

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PokemonSpriteDreamWorldModel extends PokemonSpriteDreamWorld {
  @override
  final String frontDefault;

  factory PokemonSpriteDreamWorldModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpriteDreamWorldModelFromJson(json);

  const PokemonSpriteDreamWorldModel({required this.frontDefault})
      : super(frontDefault: frontDefault);
  Map<String, dynamic> toJson() => _$PokemonSpriteDreamWorldModelToJson(this);
}
