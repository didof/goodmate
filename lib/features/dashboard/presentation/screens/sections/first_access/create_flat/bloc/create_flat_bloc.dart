import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_flat_event.dart';
part 'create_flat_state.dart';

class CreateFlatBloc extends Bloc<CreateFlatEvent, CreateFlatState> {
  CreateFlatBloc() : super(CreateFlatFirst());

  @override
  Stream<CreateFlatState> mapEventToState(
    CreateFlatEvent event,
  ) async* {
    yield CreateFlatFirst();
    if (event is CreateFlatChoiceMade) {
      if (event is TriggerNameChoosen) {
        // TODO validate name
        yield CreateFlatSecond();
      }
      if (event is TriggerPartyLengthChoosen) {
        yield CreateFlatThird();
      }
    }
  }
}
