import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat.dart';
import 'package:meta/meta.dart';

part 'create_flat_event.dart';
part 'create_flat_state.dart';

class CreateFlatBloc extends Bloc<CreateFlatEvent, CreateFlatState> {
  CreateFlatBloc() : super(CreateFlatFirst(focusOn: FocusOn.Name));

  @override
  Stream<CreateFlatState> mapEventToState(
    CreateFlatEvent event,
  ) async* {
    yield CreateFlatFirst(focusOn: FocusOn.Name);
    if (event is CreateFlatChoiceMade) {
      if (event is TriggerNameChoosen) {
        // TODO validate name
        if (event.name.isEmpty) {
          yield CreateFlatFirst(
            focusOn: FocusOn.Name,
            enabled: [Enabled.Name],
            closeSoftKeyboard: false,
            fabDestinationStep: Step.None,
            requestFocus: true,
          );
        } else {
          yield CreateFlatFirst(
            focusOn: FocusOn.PartyLength,
            enabled: [Enabled.Name, Enabled.PartyLength],
            closeSoftKeyboard: true,
            fabDestinationStep: Step.None,
            requestFocus: true,
          );
        }
      } else if (event is TriggerPartyLengthChoosen) {
        yield CreateFlatFirst(
          focusOn: FocusOn.None,
          enabled: [Enabled.Name, Enabled.PartyLength],
          closeSoftKeyboard: true,
          fabDestinationStep: Step.Second,
          requestFocus: true,
        );
      }
    } else if (event is CreateFlatShift) {
      if (event is TriggerShiftToStep) {
        switch (event.step) {
          case Step.First:
            // TODO implement
            break;
          case Step.Second:
            yield CreateFlatSecond(
              requestFocus: true,
            );
            break;
          case Step.Third:
            // TODO implement
            break;
          case Step.None:
          default:
            print('[TriggerShiftToStep] called with step:{${event.step}}');
            // do nothing
            break;
        }
      }
    }
  }
}
