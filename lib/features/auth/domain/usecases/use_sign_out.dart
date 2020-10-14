import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/authentication_repository_contract.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/core/usecases/usecases_contract.dart';

class UseSignOut extends UseCaseWithoutParams {
  final AuthenticationRepositoryContract repository;

  UseSignOut({@required this.repository});

  @override
  Future<User> call() async {
    return await repository.signOut();
  }
}
