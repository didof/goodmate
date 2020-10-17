import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/core/sql/current_user_info.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/current_user_info.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/data/datasource.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/repository_contract.dart';

class CurrentUserInfoRepositoryImpl extends CurrentUserInfoRepositoryContract {
  final CurrentUserInfoDatasourceContract datasource;
  CurrentUserInfoRepositoryImpl({@required this.datasource});

  @override
  Future<Either<Failure, DocumentSnapshot>> retrieveUserFromCloud(
      {@required String id}) async {
    try {
      final DocumentSnapshot documentSnapshot =
          await datasource.retrieveUser(id);

      //TODO save in local so that next time will be user retrieveUserFromMemory

      return Right(documentSnapshot);
    } catch (e) {
      return Left(
        RetrieveUserFailure(
            code: 'error-retrieving-user',
            message: 'something went wrong during retrieving of user $id'),
      );
    }
  }

  @override
  Future<Either<Failure, CurrentUserInfo>> retrieveUserFromMemory({
    String id,
  }) async {
    //TODO get from local
  }
}
