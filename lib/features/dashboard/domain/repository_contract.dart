import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/entities/create_flat_parameters.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/entities/current_user_info.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';

abstract class CurrentUserInfoRepositoryContract {
  Future<Either<Failure, DocumentSnapshot>> retrieveUserFromCloud(
      {@required String id});

  Future<Either<Failure, CurrentUserInfo>> retrieveUserFromMemory(
      {@required String id});

  Future<Either<Failure, DocumentReference>> createFlat(
      {@required CreateFlatParameters parameters});

  Future<Either<Failure, Null>> updateUser({
    @required String uid,
    @required String flatUid,
  });
}
