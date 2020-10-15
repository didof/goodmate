part of 'create_flat_bloc.dart';

@immutable
abstract class CreateFlatEvent {}

abstract class CreateFlatChoiceMade extends CreateFlatEvent {}

class TriggerNameChoosen extends CreateFlatChoiceMade {
  final String name;
  TriggerNameChoosen({@required this.name});
}

class TriggerPartyLengthChoosen extends CreateFlatChoiceMade {}

abstract class CreateFlatShift extends CreateFlatEvent {
  final Step step;
  CreateFlatShift(this.step);
}

class TriggerShiftToStep extends CreateFlatShift {
  final Step step;
  TriggerShiftToStep(this.step) : super(step);
}
