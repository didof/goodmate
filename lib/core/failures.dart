import 'package:meta/meta.dart';

abstract class Failure {}

class AuthenticationFailure extends Failure {}

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

class SignOutUserFailure extends AuthenticationFailure {}
