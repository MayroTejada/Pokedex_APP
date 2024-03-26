// ignore_for_file: overridden_fields

import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final int code;
  final String message;

  const Failure({this.code = 400, this.message = "ResponseMessage.unknown,"});

  @override
  List<Object?> get props => [code, message];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.code, required super.message});
}
