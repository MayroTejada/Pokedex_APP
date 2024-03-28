import 'package:equatable/equatable.dart';

class FlavorText extends Equatable {
  final int? languageId;
  final String? flavorText;

  const FlavorText({required this.languageId, required this.flavorText});

  @override
  List<Object?> get props => [languageId, flavorText];
}
