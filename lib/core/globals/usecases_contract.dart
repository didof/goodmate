import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class UseCaseWithoutParams {
  Future<void> call();
}

abstract class Params {}
