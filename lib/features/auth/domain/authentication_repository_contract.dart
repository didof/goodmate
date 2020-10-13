import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';

abstract class AuthenticationRepositoryContract {
  Future<Either<Failure, UserCredential>> createUserWithEmailAndPassword({
    @required String email,
    @required String password,
  });

  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  });

  Future<void> signOut();
}
