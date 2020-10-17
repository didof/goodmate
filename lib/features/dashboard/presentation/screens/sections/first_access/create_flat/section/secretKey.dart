import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/show_modal.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/displayers.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/fieldTile.dart';

class SecretKey extends StatelessWidget {
  final CreateFlatProvider provider;
  SecretKey(this.provider);

  void _buildModal(
    BuildContext context,
    CreateFlatProvider provider, {
    String errorMessage,
  }) {
    showModalWithSingleTextField(
      context,
      labelText: 'Secret Key',
      title: 'Decide who is allowed',
      explanation:
          '''Please, create a [key] in the field below. The [key] will be requested to your mates when they are going to join your flat.
          It\'s higly suggested to use the random generator.''',
    ).then((value) => provider.setSecretKey(value));
  }

  @override
  Widget build(BuildContext context) {
    return FieldTile(
      label: 'secret key',
      displayer: SecretKeyDisplayer(),
      checker: SecretKeyChecker(
        fixErrorFunction: (errMsg) => _buildModal(
          context,
          provider,
          errorMessage: errMsg,
        ),
      ),
      action: SecretKeyAction(
        builder: (previousValue) => _buildModal(context, provider),
      ),
    );
  }
}
