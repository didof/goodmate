import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';

abstract class CloudRepositoryContract {
  Future<Either<Failure, DocumentSnapshot>> retrieveUser({@required String id});
}
