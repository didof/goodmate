import 'package:meta/meta.dart';

abstract class Failure {
  final String code;
  final String message;
  Failure({
    @required this.code,
    @required this.message,
  });
}

abstract class AuthenticationFailure implements Failure {}

class CreateUserFailure extends AuthenticationFailure {
  final String code;
  final String message;
  CreateUserFailure({@required this.code, @required this.message});
}

class SignInUserFailure extends AuthenticationFailure {
  final String code;
  final String message;
  SignInUserFailure({@required this.code, @required this.message});
}

class SignOutUserFailure extends AuthenticationFailure {
  final String code;
  final String message;
  SignOutUserFailure({@required this.code, @required this.message});
}

class NetworkFailure extends Failure {
  final String code;
  final String message;
  NetworkFailure({@required this.code, @required this.message});
}
