import 'package:flutter_architecture_scaffold/core/usecases/usecases_contract.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationParams extends Params {
  final String email;
  final String password;
  AuthenticationParams({
    @required this.email,
    @required this.password,
  });
}

class CreateUserWithEmailAndPasswordParams extends AuthenticationParams {
  final String email;
  final String password;
  CreateUserWithEmailAndPasswordParams({
    @required this.email,
    @required this.password,
  });
}

class SignInUserWithEmailAndPasswordParams extends AuthenticationParams {
  final String email;
  final String password;
  SignInUserWithEmailAndPasswordParams({
    @required this.email,
    @required this.password,
  });
}

abstract class CloudParams extends Params {
  final String id;
  CloudParams({@required this.id});
}

class RetrieveUserParams extends CloudParams {
  final String id;
  RetrieveUserParams({@required this.id});
}
