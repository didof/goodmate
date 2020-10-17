import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/displayers.dart';

class FieldTile extends StatelessWidget {
  final Displayer displayer;
  final Checker checker;
  final Actioner action;
  final String label;
  const FieldTile({
    @required this.displayer,
    @required this.checker,
    @required this.action,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: displayer,
        leading: action,
        trailing: checker,
        subtitle: Text(label),
      ),
    );
  }
}
