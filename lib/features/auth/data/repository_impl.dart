import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/core/network/network_info.dart';
import 'package:flutter_architecture_scaffold/features/auth/data/datasource.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/authentication_repository_contract.dart';

class AuthenticationRepositoryImpl extends AuthenticationRepositoryContract {
  final AuthenticationDatasourceContract datasource;
  final NetworkInfoContract networkInfoImpl;
  AuthenticationRepositoryImpl({
    @required this.datasource,
    @required this.networkInfoImpl,
  });

  @override
  Future<Either<Failure, UserCredential>> createUserWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    if (await networkInfoImpl.isConnected) {
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
    } else {
      return Left(NetworkFailure(
        code: 'no-network-detected',
        message: 'it seems that you are not connected to internet',
      ));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signInWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    if (await networkInfoImpl.isConnected) {
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
    } else {
      return Left(NetworkFailure(
        code: 'no-network-detected',
        message: 'it seems that you are not connected to internet',
      ));
    }
  }

  @override
  Future<void> signOut() async {
    return await datasource.signOut();
  }
}
