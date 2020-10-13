part of 'cloud_bloc.dart';

@immutable
abstract class CloudEvent {}

class TriggerRetrieveUser extends CloudEvent {
  final String id;
  TriggerRetrieveUser({@required this.id});
}
