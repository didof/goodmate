import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/show_modal/with_single_text_field.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers/contracts.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider_widgets.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/widgets/correctIcon.dart';

class FlatnameChecker extends Checker<FlatNameType> {
  final ErrorFunction fixErrorFunction;
  const FlatnameChecker({@required this.fixErrorFunction});

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
        return provider.flatName.fold(
          (l) {
            return IconButton(
              color: theme.errorColor,
              splashColor: theme.accentColor,
              icon: Icon(Icons.error_outline),
              onPressed: () => fixErrorFunction(
                  '${l.invalidValue} is not valid. ${l.message}'),
              tooltip: l.message.toString(),
            );
          },
          (r) => const CorrectIcon(),
        );
      },
    );
  }
}
