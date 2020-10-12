import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/core/failures.dart';

abstract class AuthenticationRepositoryContract {
  Future<Either<CreateUserFailure, UserCredential>>
      createUserWithEmailAndPassword({
    @required String email,
    @required String password,
  });

  Future<Either<SignInUserFailure, UserCredential>> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  });
}
