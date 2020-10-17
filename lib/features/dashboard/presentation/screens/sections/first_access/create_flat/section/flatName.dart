import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/show_modal.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/displayers.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/fieldTile.dart';

class FlatName extends StatelessWidget {
  final CreateFlatProvider provider;
  FlatName(this.provider);

  void _buildModal(
    BuildContext context,
    CreateFlatProvider provider, {
    String errorMessage,
  }) {
    showModalWithSingleTextField(
      context,
      labelText: 'Flat name',
      title: 'Pick a Name for the Flat',
      explanation: 'Choose a name that will identify your flat.',
      errorMessage: errorMessage,
    ).then((value) => provider.setFlatName(value));
  }

  @override
  Widget build(BuildContext context) {
    return FieldTile(
      label: 'flat name',
      displayer: FlatNameDisplayer(),
      checker: FlatnameChecker(
        fixErrorFunction: (errMsg) => _buildModal(
          context,
          provider,
          errorMessage: errMsg,
        ),
      ),
      action: FlatNameAction(
        builder: (previousValue) => _buildModal(context, provider),
      ),
    );
  }
}
