import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_architecture_scaffold/core/globals/cloud_collections_names.dart';
import 'package:meta/meta.dart';

abstract class CloudDatasourceContract {
  Future retrieveUser(String id);
}

class CloudDatasourceRemote extends CloudDatasourceContract {
  final FirebaseFirestore firebaseCloudInstance;
  CloudDatasourceRemote({
    @required this.firebaseCloudInstance,
  });

  @override
  Future<DocumentSnapshot> retrieveUser(String id) async {
    final CollectionReference collectionReference =
        firebaseCloudInstance.collection(USERS);
    return await collectionReference.doc(id).get();
  }
}
