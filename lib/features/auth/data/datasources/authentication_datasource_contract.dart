import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class AuthenticationDatasource {
  Future<UserCredential> createUserWithEmailAndPassword({
    @required String email,
    @required String password,
  });

  Future<UserCredential> signInUserWithEmailAndPassword({
    @required String email,
    @required String password,
  });
}
