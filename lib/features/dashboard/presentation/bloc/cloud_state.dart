part of 'cloud_bloc.dart';

@immutable
abstract class CloudState {}

class CloudInitial extends CloudState {}

class CloudWaiting extends CloudState {}

class CloudError extends CloudState {
  final String code;
  final String message;
  CloudError({
    @required this.code,
    @required this.message,
  });
}

class CloudSuccess extends CloudState {
  final DocumentSnapshot documentSnapshot;
  CloudSuccess({@required this.documentSnapshot});
}
