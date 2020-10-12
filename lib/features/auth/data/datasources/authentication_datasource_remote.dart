import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import 'package:flutter_architecture_scaffold/features/auth/data/datasources/authentication_datasource_contract.dart';

class AuthenticationDatasourceRemote extends AuthenticationDatasource {
  final FirebaseAuth firebaseAuthInstance;
  AuthenticationDatasourceRemote({@required this.firebaseAuthInstance});

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    return await firebaseAuthInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<UserCredential> signInUserWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    return await firebaseAuthInstance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
