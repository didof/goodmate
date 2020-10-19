import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/entities/create_flat_parameters.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/repository_contract.dart';
import 'package:meta/meta.dart';

import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/core/globals/usecases_contract.dart';

class UseCreateFlat extends UseCase<DocumentReference, CreateFlatParameters> {
  final CurrentUserInfoRepositoryContract repository;
  UseCreateFlat({@required this.repository});

  @override
  Future<Either<Failure, DocumentReference>> call(
    CreateFlatParameters parameters,
  ) async {
    return await repository.createFlat(parameters: parameters);
  }
}
