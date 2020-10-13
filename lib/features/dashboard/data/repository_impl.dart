import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/data/datasource.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/repository_contract.dart';

class CloudRepositoryImpl extends CloudRepositoryContract {
  final CloudDatasourceRemote datasource;
  CloudRepositoryImpl({@required this.datasource});

  @override
  Future<Either<Failure, DocumentSnapshot>> retrieveUser(
      {@required String id}) async {
    try {
      final DocumentSnapshot documentSnapshot =
          await datasource.retrieveUser(id);
      return Right(documentSnapshot);
    } catch (e) {
      return Left(
        RetrieveUserFailure(
            code: 'error-retrieving-user',
            message: 'something went wrong during retrieving of user $id'),
      );
    }
  }
}
