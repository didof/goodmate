import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/repository_contract.dart';
import 'package:meta/meta.dart';

import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/core/entities/params.dart';
import 'package:flutter_architecture_scaffold/core/usecases/usecases_contract.dart';

class UseRetrieveUser extends UseCase<DocumentSnapshot, RetrieveUserParams> {
  final CloudRepositoryContract repository;
  UseRetrieveUser({@required this.repository});

  @override
  Future<Either<Failure, DocumentSnapshot>> call(
    RetrieveUserParams params,
  ) async {
    return await repository.retrieveUser(id: params.id);
  }
}
