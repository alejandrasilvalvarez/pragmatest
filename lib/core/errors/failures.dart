import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure(this.errorMessage);
  final String errorMessage;

  @override
  List<Object> get props => <Object>[errorMessage];
}

// General failures
class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);
}

class NetworkFailure extends Failure {
  const NetworkFailure()
      : super('NetworkFailure: Are you connected to internet?');
}

class CacheFailure extends Failure {
  const CacheFailure() : super('CacheFailure');
}

class AuthenticationFailure extends Failure {
  const AuthenticationFailure(super.errorMessage);
}

class GenericError extends Failure {
  const GenericError(this.title, this.subtitle, this.message) : super('');
  final String title;
  final String subtitle;
  final String message;
  @override
  List<Object> get props => <Object>[title, subtitle, message];
}
