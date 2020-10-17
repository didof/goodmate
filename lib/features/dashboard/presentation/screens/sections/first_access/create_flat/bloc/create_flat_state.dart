part of 'create_flat_bloc.dart';

@immutable
abstract class CreateFlatState {}

abstract class CreateFlatPageState extends CreateFlatState {
  final FocusOn focusOn;
  final List<Enabled> enabled;
  final bool closeSoftKeyboard;
  final Step fabDestinationStep;
  final bool requestFocus;
  CreateFlatPageState({
    this.focusOn,
    this.enabled,
    this.closeSoftKeyboard = false,
    this.fabDestinationStep = Step.None,
    this.requestFocus = false,
  });
}

class CreateFlatFirst extends CreateFlatPageState {
  final FocusOn focusOn;
  final List<Enabled> enabled;
  final bool closeSoftKeyboard;
  final Step fabDestinationStep;
  final bool requestFocus;
  CreateFlatFirst({
    this.focusOn = FocusOn.None,
    this.enabled,
    this.closeSoftKeyboard = false,
    this.fabDestinationStep = Step.None,
    this.requestFocus = false,
  });
}

class CreateFlatSecond extends CreateFlatPageState {
  final bool requestFocus;
  CreateFlatSecond({
    this.requestFocus,
  });
}

class CreateFlatThird extends CreateFlatPageState {}
