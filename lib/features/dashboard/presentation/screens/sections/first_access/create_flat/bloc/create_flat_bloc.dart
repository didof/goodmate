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
          );
        } else {
          yield CreateFlatFirst(
            focusOn: FocusOn.PartyLength,
            enabled: [
              Enabled.Name,
              Enabled.PartyLength,
            ],
            closeSoftKeyboard: true,
          );
        }
      } else if (event is TriggerPartyLengthChoosen) {
        yield CreateFlatFirst(
          enabled: [
            Enabled.Name,
            Enabled.PartyLength,
          ],
          fabSendTo: Step.Second,
        );
      }
    } else if (event is CreateFlatShift) {
      if (event is TriggerShiftToStep) {
        switch (event.step) {
          case Step.None:
            // do nothing
            break;
          case Step.First:
            // TODO implement
            break;
          case Step.Second:
            yield CreateFlatSecond(shiftTo: Step.Second);
            break;
          case Step.Third:
            // TODO implement
            break;
        }
      }
    }
  }
}
