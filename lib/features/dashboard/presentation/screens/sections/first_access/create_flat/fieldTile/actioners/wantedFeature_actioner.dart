import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners/contracts.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';

class WantedFeatureActioner extends Actioner<WantedFeatureType> {
  final CreateFlatProvider provider;
  final ThemeData theme;
  final WithChoosenFeaturesBuilder withChoosenFeaturesBuilder;
  WantedFeatureActioner(
    this.provider,
    this.theme, {
    @required WithChoosenFeaturesBuilder action,
  }) : withChoosenFeaturesBuilder = action;

  @override
  Widget build(BuildContext context) {
    return provider.wantedFeatures.fold((l) {
      return CircleAvatar(
        backgroundColor: theme.errorColor,
        child: IconButton(
          icon: const Icon(Icons.dashboard),
          onPressed: () {
            return withChoosenFeaturesBuilder(
              context,
              List.generate(3, (_) => false),
              
            );
          },
        ),
      );
    }, (r) {
      return CircleAvatar(
        backgroundColor: theme.primaryColor,
        child: IconButton(
          icon: const Icon(Icons.dashboard),
          onPressed: () {
            return withChoosenFeaturesBuilder(context, r.values);
          },
        ),
      );
    });
  }
}
