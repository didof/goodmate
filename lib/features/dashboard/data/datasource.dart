import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_architecture_scaffold/core/globals/cloud_collections_names.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/entities/create_flat_parameters.dart';
import 'package:meta/meta.dart';

abstract class CurrentUserInfoDatasourceContract {
  Future<DocumentSnapshot> retrieveUser(String id);

  Future<DocumentReference> createFlat(CreateFlatParameters parameters);

  Future<void> updateUser(String uid, String flatUid);
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

  @override
  Future<DocumentReference> createFlat(CreateFlatParameters parameters) async {
    final CollectionReference collectionReference =
        firebaseCloudInstance.collection(FLATS);

    final mappedParameters = parameters.toMap();

    return await collectionReference.add(mappedParameters);
  }

  @override
  Future<void> updateUser(String id, String flatUid) async {
    final CollectionReference collectionReference =
        firebaseCloudInstance.collection(USERS);
    return await collectionReference.doc(id).update({
      'tenantIn': [flatUid],
    });
  }
}
