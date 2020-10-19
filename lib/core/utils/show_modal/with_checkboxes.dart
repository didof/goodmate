import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/globals/widgets/titleWithDismissable.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/section/wantedFeatures.dart';

Future<void> showModalWithCheckBoxes(
  BuildContext context,
  ThemeData theme, {
  String title = 'Please choose from below',
  List<LabelledIcon> children,
}) async {
  await showDialog(
    context: context,
    useSafeArea: true,
    builder: (context) {
      return AlertDialog(
        title: TitleWithDismissable(title, theme: theme),
        content: SingleChildScrollView(
          child: Column(
            children: children.map((c) {
              if (c is WantedFeatureCheckboxData) {
                return CheckboxListTile(
                  title: Text(c.title),
                  secondary: Icon(c.icon),
                  subtitle: Text(c.explanation),
                  isThreeLine: true,
                  checkColor: theme.accentColor,
                  activeColor: theme.primaryColor,
                  selected: true,
                  value: true,
                  onChanged: (value) {},
                  controlAffinity: ListTileControlAffinity.platform,
                );
              }
            }).toList(),
          ),
        ),
      );
    },
  );
}
