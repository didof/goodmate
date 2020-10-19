import 'package:flutter_architecture_scaffold/core/globals/usecases_contract.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/entities/create_flat_parameters.dart';
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

class CreateFlatParams extends CloudParams {
  final CreateFlatParameters parameters;
  CreateFlatParams({@required this.parameters});
}
