part of 'create_flat_bloc.dart';

@immutable
abstract class CreateFlatEvent {}

abstract class CreateFlatChoiceMade extends CreateFlatEvent {}

class TriggerNameChoosen extends CreateFlatChoiceMade {}

class TriggerPartyLengthChoosen extends CreateFlatChoiceMade {}
