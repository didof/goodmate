part of 'create_flat_bloc.dart';

@immutable
abstract class CreateFlatState {}

abstract class CreateFlatPageState extends CreateFlatState {
  final FocusOn focusOn;
  final List<Enabled> enabled;
  final bool closeSoftKeyboard;
  final Step fabSendTo;
  final Step shiftTo;
  CreateFlatPageState({
    this.focusOn,
    this.enabled,
    this.closeSoftKeyboard = false,
    this.fabSendTo,
    this.shiftTo,
  });
}

class CreateFlatFirst extends CreateFlatPageState {
  final FocusOn focusOn;
  final List<Enabled> enabled;
  final bool closeSoftKeyboard;
  final Step fabSendTo;
  CreateFlatFirst({
    this.focusOn = FocusOn.None,
    this.enabled,
    this.closeSoftKeyboard = false,
    this.fabSendTo,
  });
}

class CreateFlatSecond extends CreateFlatPageState {
  final Step shiftTo;
  CreateFlatSecond({this.shiftTo});
}

class CreateFlatThird extends CreateFlatPageState {}
