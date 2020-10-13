import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/core/failures.dart';
import 'package:flutter_architecture_scaffold/core/usecases/params.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/repositories/authentication_repository_contract.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/core/usecases/usecases_contract.dart';

class UseSignOut extends UseCase<void, NoParams> {
  final AuthenticationRepositoryContract repository;

  UseSignOut({@required this.repository});

  @override
  Future<Either<SignOutUserFailure, void>> call(NoParams noParams) async {
    return await repository.signOut();
  }
}

class NoParams extends Params {}
