part of 'current_user_info_bloc.dart';

@immutable
abstract class CurrentUserInfoState {}

class CloudConnectToCloud extends CurrentUserInfoState {}

class CloudWaiting extends CurrentUserInfoState {
  final String message;
  CloudWaiting({this.message});
}

class CloudError extends CurrentUserInfoState {
  final String code;
  final String message;
  CloudError({
    @required this.code,
    @required this.message,
  });
}

abstract class CloudSuccess extends CurrentUserInfoState {
  final DocumentSnapshot documentSnapshot;
  CloudSuccess({@required this.documentSnapshot});
}

class CloudSuccessButFirstAccess extends CloudSuccess {
  final DocumentSnapshot documentSnapshot;
  CloudSuccessButFirstAccess({@required this.documentSnapshot});
}

class CloudSuccessAndAlreadyTenantIn extends CloudSuccess {
  final DocumentReference documentReference;
  CloudSuccessAndAlreadyTenantIn({@required this.documentReference});
}
