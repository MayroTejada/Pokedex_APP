import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;
  final int id;

  const Pokemon(
      {required this.id, required this.name});
  @override
  List<Object?> get props => [name, id];
}
