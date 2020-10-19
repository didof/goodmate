import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_architecture_scaffold/core/globals/cloud_collections_names.dart';
import 'package:meta/meta.dart';

import 'package:flutter_architecture_scaffold/core/globals/extensions.dart';

abstract class AuthenticationDatasourceContract {
  Future<UserCredential> createUserWithEmailAndPassword({
    @required String email,
    @required String password,
  });

  Future<UserCredential> signInUserWithEmailAndPassword({
    @required String email,
    @required String password,
  });

  Future<User> signOut();
}

class AuthenticationDatasourceRemote extends AuthenticationDatasourceContract {
  final FirebaseAuth firebaseAuthInstance;
  final FirebaseFirestore firebaseCloudInstance;
  AuthenticationDatasourceRemote({
    @required this.firebaseAuthInstance,
    @required this.firebaseCloudInstance,
  });

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    @required String email,
    @required String password,
  }) async {
    final UserCredential userCredential =
        await firebaseAuthInstance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    final DocumentReference documentReference =
        firebaseCloudInstance.collection(USERS).doc(userCredential.user.uid);

    await documentReference.set({
      'e-mail_address': userCredential.user.email,
      'display_name': userCredential.user.email
          .selectStrBefore('@')
          .capitalizeFirstLetter(),
    });

    return userCredential;
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

  @override
  Future<User> signOut() async {
    try {
      await firebaseAuthInstance.signOut();
      return firebaseAuthInstance.currentUser;
    } catch (e) {
      throw UnimplementedError('signOut bu: $e');
    }
  }
}
