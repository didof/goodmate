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

abstract class CloudFailure extends Failure {
  final String code;
  final String message;
  CloudFailure({@required this.code, @required this.message});
}

class RetrieveUserFailure extends CloudFailure {
  final String code;
  final String message;
  RetrieveUserFailure({@required this.code, @required this.message});
}

class CreateFlatFailure extends CloudFailure {
  final String code;
  final String message;
  CreateFlatFailure({@required this.code, @required this.message});
}
class UpdateUserFailure extends CloudFailure {
  final String code;
  final String message;
  UpdateUserFailure({@required this.code, @required this.message});
}
