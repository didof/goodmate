import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/show_modal/with_checkboxes.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners/wantedFeature_actioner.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers/wantedFeature_checker.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/displayers/wantedFeature_displayer.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/fieldTile.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider_widgets.dart';

class WantedFeatures extends StatelessWidget {
  const WantedFeatures();

  void _buildModal(
    BuildContext context,
    CreateFlatProvider provider,
    ThemeData theme,
  ) {
    showModalWithCheckBoxes(
      context,
      theme,
      title: 'Get some features',
      children: features,
    );
  }

  static const features = [
    const WantedFeatureCheckboxData(
      icon: Icons.chat,
      title: 'Chat',
      explanation: 'allow your mates to write in real-time',
    ),
    const WantedFeatureCheckboxData(
      icon: Icons.calendar_today,
      title: 'Cleaning Schedule',
      explanation: 'create a calendar to better manage the cleaning shifts',
    ),
    const WantedFeatureCheckboxData(
        icon: Icons.shopping_cart,
        title: 'Grocery Shopping',
        explanation:
            'Is the toilet paper finished? Thanks to this feature will no longer be a problem'),
  ];

  @override
  Widget build(BuildContext context) {
    return CFC(
      builder: (context, provider, child, theme) {
        return FieldTile(
          label: 'wanted features',
          action: WantedFeatureActioner(
            provider,
            theme,
            action: (context, choosenFeatures) {
              _buildModal(context, provider, theme);
            },
          ),
          displayer: WantedFeaturesDisplayer(provider, theme),
          checker: WantedFeatureChecker(provider, theme),
        );
      },
    );
  }
}

abstract class LabelledIcon {
  final String title;
  final IconData icon;
  const LabelledIcon({
    @required this.title,
    @required this.icon,
  });
}

class WantedFeatureCheckboxData extends LabelledIcon {
  final String title;
  final IconData icon;
  final String explanation;
  const WantedFeatureCheckboxData({
    @required this.title,
    @required this.icon,
    this.explanation,
  });
}
