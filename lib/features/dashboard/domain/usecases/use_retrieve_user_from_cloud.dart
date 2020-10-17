import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/repository_contract.dart';
import 'package:meta/meta.dart';

import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/core/entities/params.dart';
import 'package:flutter_architecture_scaffold/core/globals/usecases_contract.dart';

class UseRetrieveUserFromCloud
    extends UseCase<DocumentSnapshot, RetrieveUserParams> {
  final CurrentUserInfoRepositoryContract repository;
  UseRetrieveUserFromCloud({@required this.repository});

  @override
  Future<Either<Failure, DocumentSnapshot>> call(
    RetrieveUserParams params,
  ) async {
    return await repository.retrieveUserFromCloud(id: params.id);
  }
}
