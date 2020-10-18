import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/displayers.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/fieldTile.dart';
import 'package:provider/provider.dart';

class WantedFeatures extends StatelessWidget {
  final CreateFlatProvider provider;
  WantedFeatures(this.provider);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final provider = Provider.of<CreateFlatProvider>(context);
    return FieldTile(
      label: 'wanted features',
      action: WantedFeatureActioner(theme: theme),
      displayer: WantedFeaturesDisplayer(theme: theme, provider: provider),
      checker: WantedFeatureChecker(theme: theme, provider: provider),
    );
  }
}
