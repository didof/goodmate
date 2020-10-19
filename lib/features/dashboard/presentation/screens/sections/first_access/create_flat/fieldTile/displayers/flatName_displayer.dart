import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/displayers/contracts.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider_widgets.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';

class FlatNameDisplayer extends StringDisplayer<FlatNameType> {
  FlatNameDisplayer();

  @override
  Widget build(BuildContext context) {
    return CFC(
      builder: (context, provider, child, theme) {
        return provider.flatName.fold(
          (l) {
            return Text(
              l.shortMessage.toString(),
              style: TextStyle(color: theme.errorColor),
            );
          },
          (r) {
            return Text(
              r.value.toString(),
              style: TextStyle(color: theme.primaryColor),
            );
          },
        );
      },
    );
  }
}
