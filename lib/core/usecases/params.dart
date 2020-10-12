import 'package:meta/meta.dart';

abstract class Params {}

class CreateUserWithEmailAndPasswordParams extends Params {
  final String email;
  final String password;
  CreateUserWithEmailAndPasswordParams({
    @required this.email,
    @required this.password,
  });
}

class SignInUserWithEmailAndPasswordParams extends Params {
  final String email;
  final String password;
  SignInUserWithEmailAndPasswordParams({
    @required this.email,
    @required this.password,
  });
}
