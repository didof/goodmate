import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/section/wantedFeatures.dart';

class CustomToggleButtons extends StatelessWidget {
  final List<bool> isSelected;
  final List<LabelledIcon> children;
  final ThemeData theme;
  final CreateFlatProvider provider;
  const CustomToggleButtons(
    this.provider,
    this.theme, {
    @required this.children,
    @required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: children.map((c) => Icon(c.icon)).toList(),
      isSelected: isSelected,
      color: Colors.grey,
      selectedColor: theme.accentColor,
      fillColor: theme.primaryColor,
      splashColor: theme.accentColor,
      renderBorder: false,
      borderRadius: BorderRadius.circular(15.0),
      onPressed: (index) => provider.setWantedFeatures(index),
    );
  }
}
