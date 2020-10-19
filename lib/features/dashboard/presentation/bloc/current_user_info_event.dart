part of 'current_user_info_bloc.dart';

@immutable
abstract class CurrentUserInfoEvent {
  const CurrentUserInfoEvent();
}

class TriggerRetrieveUser extends CurrentUserInfoEvent {
  final String id;
  final bool localFirst;
  const TriggerRetrieveUser({
    @required this.id,
    this.localFirst = true,
  });
}

class TriggerCreateFlat extends CurrentUserInfoEvent {
  final CreateFlatParameters parameters;
  const TriggerCreateFlat({@required this.parameters});
}
