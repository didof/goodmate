import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_architecture_scaffold/core/usecases/params.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/repositories/authentication_repository_contract.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/core/failures.dart';
import 'package:flutter_architecture_scaffold/core/usecases/usecases_contract.dart';

class UseSignInUserWithEmailAndPassword
    extends UseCase<UserCredential, SignInUserWithEmailAndPasswordParams> {
  final AuthenticationRepositoryContract repository;

  UseSignInUserWithEmailAndPassword({@required this.repository});

  @override
  Future<Either<SignInUserFailure, UserCredential>> call(
    SignInUserWithEmailAndPasswordParams paramsCredentials,
  ) async {
    return await repository.signInWithEmailAndPassword(
      email: paramsCredentials.email,
      password: paramsCredentials.password,
    );
  }
}
