// ignore_for_file: overridden_fields

import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon.dart';

part 'pokemon_model.g.dart';

@JsonSerializable()
class PokemonModel extends Pokemon {
  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  @override
  final int id;
  @override
  final String name;
  const PokemonModel({required this.id, required this.name}) : super(id, name);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}
