import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/bloc_providers_methods.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/bloc/create_flat_bloc.dart';

class FlatNameTextField extends StatelessWidget {
  final TextEditingController controller;
  const FlatNameTextField({
    Key key,
    @required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: const InputDecoration(
        labelText: 'Flat Name',
        icon: const Icon(Icons.home),
      ),
      controller: controller,
      onEditingComplete: () {
        dispatchCreateFlatEvent(
          context: context,
          event: TriggerNameChoosen(name: controller.text),
        );
      },
    );
  }
}
