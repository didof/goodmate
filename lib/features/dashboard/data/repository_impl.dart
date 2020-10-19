import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/entities/create_flat_parameters.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/entities/current_user_info.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/data/datasource.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/repository_contract.dart';

class CurrentUserInfoRepositoryImpl extends CurrentUserInfoRepositoryContract {
  final CurrentUserInfoDatasourceContract datasource;
  CurrentUserInfoRepositoryImpl({@required this.datasource});

  @override
  Future<Either<CloudFailure, DocumentSnapshot>> retrieveUserFromCloud({
    @required String id,
  }) async {
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

  @override
  Future<Either<CloudFailure, DocumentReference>> createFlat({
    CreateFlatParameters parameters,
  }) async {
    try {
      final documentReference = await datasource.createFlat(parameters);
      return right(documentReference);
    } catch (e) {
      print(e);
      return left(
        CreateFlatFailure(
            code: 'error-during-create-flat',
            message: 'Something went wrong during the creation of the flat'),
      );
    }
  }

  @override
  Future<Either<Failure, Null>> updateUser({
    @required String uid,
    @required String flatUid,
  }) async {
    try {
      await datasource.updateUser(uid, flatUid);
      return right(Null);
    } catch (e) {
      print(e);
      return left(UpdateUserFailure(
        code: 'update-user-error',
        message: 'something went wrong during the updating of the user',
      ));
    }
  }
}
