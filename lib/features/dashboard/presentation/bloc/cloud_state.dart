part of 'cloud_bloc.dart';

@immutable
abstract class CloudState {}

class CloudConnectToCloud extends CloudState {}

class CloudWaiting extends CloudState {
  final String message;
  CloudWaiting({this.message});
}

class CloudError extends CloudState {
  final String code;
  final String message;
  CloudError({
    @required this.code,
    @required this.message,
  });
}

abstract class CloudSuccess extends CloudState {
  final DocumentSnapshot documentSnapshot;
  CloudSuccess({@required this.documentSnapshot});
}

class CloudSuccessButFirstAccess extends CloudSuccess {
  final DocumentSnapshot documentSnapshot;
  CloudSuccessButFirstAccess({@required this.documentSnapshot});
}

class CloudSuccessAndAlreadyTenantIn extends CloudSuccess {
  final DocumentSnapshot documentSnapshot;
  CloudSuccessAndAlreadyTenantIn({@required this.documentSnapshot});
}
