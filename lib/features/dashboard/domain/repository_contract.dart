import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/entities/current_user_info.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';

abstract class CurrentUserInfoRepositoryContract {
  Future<Either<Failure, DocumentSnapshot>> retrieveUserFromCloud({
    @required String id,
  });

  Future<Either<Failure, CurrentUserInfo>> retrieveUserFromMemory({
    @required String id,
  });
}
