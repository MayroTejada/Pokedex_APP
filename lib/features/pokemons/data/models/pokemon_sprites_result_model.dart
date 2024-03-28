import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_sprites_model.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon_sprite_result.dart';

part 'pokemon_sprites_result_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PokemonSpriteResulModel extends PokemonSpriteResult {
  @override
  final PokemonSpritesModel sprites;
  const PokemonSpriteResulModel({required this.sprites})
      : super(sprites: sprites);
  factory PokemonSpriteResulModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpriteResulModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpriteResulModelToJson(this);
}
