import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/repository_contract.dart';
import 'package:meta/meta.dart';

import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/core/globals/usecases_contract.dart';

class UseUpdateUser extends UseCase<DocumentReference, UpdateUserParams> {
  final CurrentUserInfoRepositoryContract repository;
  UseUpdateUser({@required this.repository});

  @override
  Future<Either<Failure, DocumentReference>> call(
    UpdateUserParams params,
  ) async {
    return await repository.updateUser(
      uid: params.uid,
      flatUid: params.flatUid,
    );
  }
}

class UpdateUserParams {
  final String uid;
  final String flatUid;
  UpdateUserParams({
    @required this.uid,
    @required this.flatUid,
  });
}
