import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/widgets/correctIcon.dart';

import 'contracts.dart';

class WantedFeatureChecker extends Checker<WantedFeatureType> {
  final ThemeData theme;
  final CreateFlatProvider provider;
  WantedFeatureChecker(this.provider, this.theme);

  @override
  Widget build(BuildContext context) {
    return provider.wantedFeatures.fold(
      (l) {
        return IconButton(
          color: theme.errorColor,
          splashColor: theme.accentColor,
          icon: Icon(Icons.error_outline),
          onPressed: () => provider.setWantedFeatures(0),
          tooltip: l.message.toString(),
        );
      },
      (r) => const CorrectIcon(),
    );
  }
}