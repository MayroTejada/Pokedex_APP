// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_specy_model.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_sprites_result_model.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';

part 'pokemon_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PokemonModel extends Pokemon {
  @override
  final String name;
  @override
  final int id;
  @override
  final List<PokemonSpriteResulModel?>? sprites;
  @override
  final PokemonSpecyModel? pokemonSpecy;

  const PokemonModel(
      {required this.name,
      required this.id,
      this.sprites,
      required this.pokemonSpecy})
      : super(name: name, id: id, sprites: sprites, pokemonSpecy: pokemonSpecy);
  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}
