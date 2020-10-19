import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/show_modal/with_single_text_field.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners/secretKey_actioner.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers/secretKey_checker.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/displayers/secretKey_displayer.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/fieldTile.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider_widgets.dart';

class SecretKey extends StatelessWidget {
  const SecretKey();

  void _buildModal(
    BuildContext context,
    CreateFlatProvider provider,
    ThemeData theme, {
    String errorMessage,
  }) {
    showModalWithSingleTextField(
      context,
      theme,
      labelText: 'Secret Key',
      title: 'Decide who is allowed',
      explanation:
          '''Please, create a [key] in the field below. The [key] will be requested to your mates when they are going to join your flat.
          It\'s higly suggested to use the random generator.''',
    ).then((value) => provider.setSecretKey(value));
  }

  @override
  Widget build(BuildContext context) {
    return CFC(
      builder: (context, provider, child, theme) {
        return FieldTile(
          label: 'secret key',
          displayer: SecretKeyDisplayer(provider, theme),
          checker: SecretKeyChecker(
            provider,
            theme,
            fixErrorFunction: (errMsg) =>
                _buildModal(context, provider, theme, errorMessage: errMsg),
          ),
          action: SecretKeyActioner(
            builder: (previousValue) => _buildModal(context, provider, theme),
            provider: provider,
            theme: theme,
          ),
        );
      },
    );
  }
}
