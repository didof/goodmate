import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/bloc_providers_methods.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/bloc/create_flat_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../create_flat.dart';

class PartyLengthSlider extends StatefulWidget {
  final FocusNode partyLengthFocusNode;
  PartyLengthSlider({
    Key key,
    focusNode,
  })  : partyLengthFocusNode = focusNode,
        super(key: key);

  @override
  _PartyLengthSliderState createState() => _PartyLengthSliderState();
}

class _PartyLengthSliderState extends State<PartyLengthSlider> {
  double persons;

  @override
  void initState() {
    persons = 3;
    super.initState();
  }

  Widget _buildSlider(bool enabled) {
    return Slider(
      value: persons,
      min: 2,
      max: 10,
      divisions: 8,
      label: '${persons.floor()}',
      focusNode: widget.partyLengthFocusNode,
      onChanged: enabled
          ? (double newPersons) {
              setState(() {
                persons = newPersons;
              });
            }
          : null,
      onChangeEnd: (value) {
        dispatchCreateFlatEvent(
          context: context,
          event: TriggerPartyLengthChoosen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('2 - How many persons?'),
        BlocBuilder<CreateFlatBloc, CreateFlatState>(
          builder: (context, state) {
            if (state is CreateFlatFirst && state.enabled != null)
              return _buildSlider(state.enabled.contains(Enabled.PartyLength));
            return _buildSlider(false);
          },
        ),
      ],
    );
  }
}
