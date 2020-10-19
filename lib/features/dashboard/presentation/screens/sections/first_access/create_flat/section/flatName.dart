import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/show_modal/with_single_text_field.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners/flatName_actioner.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers/flatName_checker.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/displayers/flatName_displayer.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/fieldTile.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider_widgets.dart';

class FlatName extends StatelessWidget {
  const FlatName();

  void _buildModal(
    BuildContext context,
    CreateFlatProvider provider,
    ThemeData theme, {
    String errorMessage,
  }) {
    showModalWithSingleTextField(
      context,
      theme,
      labelText: 'Flat name',
      title: 'Pick a Name for the Flat',
      explanation: 'Choose a name that will identify your flat.',
      errorMessage: errorMessage,
    ).then((value) => provider.setFlatName(value));
  }

  @override
  Widget build(BuildContext context) {
    return CFC(
      builder: (context, provider, child, theme) {
        return FieldTile(
          label: 'flat name',
          action: FlatNameActioner(
            action: (previousValue) {
              print(previousValue);
              _buildModal(context, provider, theme);
            },
          ),
          displayer: FlatNameDisplayer(),
          checker: FlatnameChecker(
            fixErrorFunction: (errMsg) =>
                _buildModal(context, provider, theme, errorMessage: errMsg),
          ),
        );
      },
    );
  }
}
