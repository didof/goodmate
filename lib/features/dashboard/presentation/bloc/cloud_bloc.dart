import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/core/entities/params.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/usecases/use_retrieve_user.dart';
import 'package:meta/meta.dart';

part 'cloud_event.dart';
part 'cloud_state.dart';

class CloudBloc extends Bloc<CloudEvent, CloudState> {
  final UseRetrieveUser useRetrieveUser;

  CloudBloc({@required this.useRetrieveUser}) : super(CloudConnectToCloud());

  @override
  Stream<CloudState> mapEventToState(
    CloudEvent event,
  ) async* {
    yield CloudConnectToCloud();
    if (event is TriggerRetrieveUser) {
      yield CloudWaiting(message: 'Connecting to the Cloud ...');
      final Either<Failure, DocumentSnapshot> doc =
          await useRetrieveUser(RetrieveUserParams(id: event.id));
      yield CloudWaiting(message: 'User info received ...');
      yield* doc.fold(
        (l) async* {
          if (l is RetrieveUserFailure) {
            yield CloudError(code: l.code, message: l.message);
          }
        },
        (r) async* {
          if (r.data().containsKey('tenantIn')) {
            yield CloudSuccessAndAlreadyTenantIn(documentSnapshot: r);
          } else {
            yield CloudSuccessButFirstAccess(documentSnapshot: r);
          }
        },
      );
    }
  }
}
