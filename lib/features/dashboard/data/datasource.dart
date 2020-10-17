import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_architecture_scaffold/core/globals/cloud_collections_names.dart';
import 'package:meta/meta.dart';

abstract class CurrentUserInfoDatasourceContract {
  Future retrieveUser(String id);
}

class CurrentUserInfoDatasourceRemote
    extends CurrentUserInfoDatasourceContract {
  final FirebaseFirestore firebaseCloudInstance;
  CurrentUserInfoDatasourceRemote({
    @required this.firebaseCloudInstance,
  });

  @override
  Future<DocumentSnapshot> retrieveUser(String id) async {
    final CollectionReference collectionReference =
        firebaseCloudInstance.collection(USERS);
    return await collectionReference.doc(id).get();
  }
}
