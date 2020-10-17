part of 'current_user_info_bloc.dart';

@immutable
abstract class CurrentUserInfoEvent {}

class TriggerRetrieveUser extends CurrentUserInfoEvent {
  final String id;
  final bool localFirst;
  TriggerRetrieveUser({
    @required this.id,
    this.localFirst = true,
  });
}
