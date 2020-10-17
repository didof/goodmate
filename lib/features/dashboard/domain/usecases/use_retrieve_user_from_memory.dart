import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/current_user_info.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/repository_contract.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/core/entities/params.dart';
import 'package:flutter_architecture_scaffold/core/globals/usecases_contract.dart';
import 'package:flutter_architecture_scaffold/core/sql/current_user_info.dart';

class UseRetrieveUserFromMemory
    extends UseCase<CurrentUserInfo, RetrieveUserParams> {
  final CurrentUserInfoRepositoryContract repository;
  UseRetrieveUserFromMemory({@required this.repository});

  @override
  Future<Either<Failure, CurrentUserInfo>> call(
    RetrieveUserParams params,
  ) async {
    return await repository.retrieveUserFromMemory(id: params.id);
  }
}
