import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/features/pokemons/data/models/pokemon_model.dart';

part 'pokemon_list_response_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PokemonListResponseModel {
  final List<PokemonModel> pokemonSpecies;
  factory PokemonListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListResponseModelFromJson(json);

  PokemonListResponseModel({required this.pokemonSpecies});
  Map<String, dynamic> toJson() => _$PokemonListResponseModelToJson(this);
}
