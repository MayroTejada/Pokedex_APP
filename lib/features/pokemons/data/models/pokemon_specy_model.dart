import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/features/pokemons/data/models/text_flavor_model.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/pokemon_specy.dart';

part 'pokemon_specy_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PokemonSpecyModel extends PokemonSpecy {
  @override
  final List<FlavorTextModel> flavorTexts;
  const PokemonSpecyModel({required this.flavorTexts})
      : super(flavorTexts: flavorTexts);
  factory PokemonSpecyModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonSpecyModelFromJson(json);
  Map<String, dynamic> toJson() => _$PokemonSpecyModelToJson(this);
}
