import 'package:json_annotation/json_annotation.dart';
import 'package:pokedex_app/features/pokemons/domain/entities/flavor_text.dart';

part 'text_flavor_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class FlavorTextModel extends FlavorText {
  const FlavorTextModel({required super.languageId, required super.flavorText});
  factory FlavorTextModel.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextModelFromJson(json);
  Map<String, dynamic> toJson() => _$FlavorTextModelToJson(this);
}
