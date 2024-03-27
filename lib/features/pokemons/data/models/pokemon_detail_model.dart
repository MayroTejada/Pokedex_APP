// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_model.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_sprites_model.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon_detail.dart';

part 'pokemon_detail_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PokemonDetailModel extends PokemonDetail {
  @override
  final PokemonModel? pokemon;
  @override
  final PokemonSpritesModel? sprites;
  const PokemonDetailModel({this.pokemon, this.sprites})
      : super(pokemon: pokemon, sprites: sprites);
  factory PokemonDetailModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonDetailModelToJson(this);
}
