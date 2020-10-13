import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'package:flutter_architecture_scaffold/core/failures.dart';
import 'package:flutter_architecture_scaffold/features/auth/data/datasources/authentication_datasource_remote.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/repositories/authentication_repository_contract.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepositoryContract {
  final AuthenticationDatasourceRemote datasource;
  AuthenticationRepositoryImpl({@required this.datasource});

  // TODO add network info

  @override
  Future<Either<CreateUserFailure, UserCredential>>
      createUserWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await datasource.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(CreateUserFailure(
        code: e.code,
        message: e.message,
      ));
    } catch (e) {
      print(
          '[Authentiation_impl:createUserWithEmailAndPassword] unimplementedError: $e');
      throw UnimplementedError();
    }
  }

  @override
  Future<Either<SignInUserFailure, UserCredential>> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    try {
      final UserCredential userCredential =
          await datasource.signInUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      return Left(SignInUserFailure(
        code: e.code,
        message: e.message,
      ));
    } catch (e) {
      print(
          '[Authentiation_impl:signInUserWithEmailAndPassword] unimplementedError: $e');
      throw UnimplementedError();
    }
  }

  @override
  Future<Either<SignOutUserFailure, void>> signOut() async {
    return await datasource.signOut();
  }
}
