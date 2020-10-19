import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers/contracts.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider_widgets.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/widgets/correctIcon.dart';

class FlatnameChecker extends Checker<FlatNameType> {
  final ErrorFunction fixErrorFunction;
  FlatnameChecker({@required this.fixErrorFunction});

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
