// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';

part 'pokemon_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PokemonModel extends Pokemon {
  @override
  final String name;
  const PokemonModel({required this.name}) : super(name);
  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}
