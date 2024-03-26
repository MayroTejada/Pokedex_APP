import 'package:equatable/equatable.dart';

class Pokemon extends Equatable {
  final String name;

  const Pokemon(this.name);
  @override
  List<Object?> get props => [name];
}
