import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/entities/create_flat_parameters.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/usecases/use_create_flat.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/usecases/use_retrieve_user_from_memory.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/usecases/use_update_user.dart';
import 'package:meta/meta.dart';

import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/core/entities/params.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/usecases/use_retrieve_user_from_cloud.dart';

part 'current_user_info_event.dart';
part 'current_user_info_state.dart';

class CurrentUserInfoBloc
    extends Bloc<CurrentUserInfoEvent, CurrentUserInfoState> {
  final UseRetrieveUserFromCloud useRetrieveUserFromCloud;
  final UseRetrieveUserFromMemory useRetrieveUserFromMemory;
  final UseCreateFlat useCreateFlat;
  final UseUpdateUser useUpdateUser;

  CurrentUserInfoBloc({
    @required this.useRetrieveUserFromCloud,
    @required this.useRetrieveUserFromMemory,
    @required this.useCreateFlat,
    @required this.useUpdateUser,
  }) : super(CloudConnectToCloud());

  @override
  Stream<CurrentUserInfoState> mapEventToState(
    CurrentUserInfoEvent event,
  ) async* {
    yield CloudConnectToCloud();

    if (event is TriggerRetrieveUser) {
      yield CloudWaiting(message: 'Retrieving the user from');
      if (event.localFirst) {
        yield CloudWaiting(message: 'Retrieving the user from the memory');
        // TODO implement useRetrieveUserFromMemory feature
        // final Either<Failure, CurrentUserInfo> currentUserInfo =
        // await useRetrieveUserFromMemory();
      }

      yield CloudWaiting(message: 'Retrieving the user from the cloud');
      final Either<Failure, DocumentSnapshot> doc =
          await useRetrieveUserFromCloud(RetrieveUserParams(id: event.id));
      yield CloudWaiting(message: 'User info received ...');
      yield* doc.fold(
        (l) async* {
          if (l is RetrieveUserFailure) {
            yield CloudError(code: l.code, message: l.message);
          }
        },
        (r) async* {
          if (r.data().containsKey('tenantIn')) {
            yield CloudSuccessAndAlreadyTenantIn(documentReference: null);
          } else {
            yield CloudSuccessButFirstAccess(documentSnapshot: r);
          }
        },
      );
    } else if (event is TriggerCreateFlat) {
      yield CloudWaiting(message: 'sending request to Cloud ...');
      final Either<Failure, DocumentReference> documentReference =
          await useCreateFlat(event.parameters);
      yield CloudWaiting(message: 'elaborating response ...');
      yield* documentReference.fold((l) async* {
        yield CloudError(code: l.code, message: l.message);
      }, (r) async* {
        yield CloudWaiting(message: 'updating your profile ...');
        await useUpdateUser(UpdateUserParams(
          uid: event.parameters.adminUid,
          flatUid: r.id,
        ));

        yield CloudSuccessAndAlreadyTenantIn(documentReference: r);
      });
    }
  }
}
