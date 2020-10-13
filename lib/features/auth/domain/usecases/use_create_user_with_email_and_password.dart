import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_architecture_scaffold/core/entities/params.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/authentication_repository_contract.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/core/usecases/usecases_contract.dart';

class UseCreateUserWithEmailAndPassword
    extends UseCase<UserCredential, CreateUserWithEmailAndPasswordParams> {
  final AuthenticationRepositoryContract repository;

  UseCreateUserWithEmailAndPassword({@required this.repository});

  @override
  Future<Either<Failure, UserCredential>> call(
    CreateUserWithEmailAndPasswordParams paramsCredentials,
  ) async {
    return await repository.createUserWithEmailAndPassword(
      email: paramsCredentials.email,
      password: paramsCredentials.password,
    );
  }
}
