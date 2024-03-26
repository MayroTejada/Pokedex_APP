import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final int id;
  final String name;

  const Pokemon(this.id, this.name);
  @override
  List<Object?> get props => [id, name];
}
