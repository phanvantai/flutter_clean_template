import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);
  @override
  List<Object> get props => [message];
}

// General failures, need to be update
class ServerFailure extends Failure {
  const ServerFailure(String message) : super(message);
}
