import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/section/wantedFeatures.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/widgets/toggleButtons.dart';

import 'contracts.dart';

class WantedFeaturesDisplayer extends ListOfBoolDisplayer<WantedFeatureType> {
  final ThemeData theme;
  final CreateFlatProvider provider;
  WantedFeaturesDisplayer(this.provider, this.theme);

  @override
  Widget build(BuildContext context) {
    return provider.wantedFeatures.fold(
      (l) {
        return CustomToggleButtons(
          provider,
          theme,
          children: WantedFeatures.features,
          isSelected: List.generate(3, (_) => false),
        );
      },
      (r) {
        return CustomToggleButtons(
          provider,
          theme,
          children: WantedFeatures.features,
          isSelected: r.values,
        );
      },
    );
  }
}
