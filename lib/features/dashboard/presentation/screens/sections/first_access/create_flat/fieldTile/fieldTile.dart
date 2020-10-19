import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners/contracts.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers/contracts.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/displayers/contracts.dart';

class FieldTile extends StatelessWidget {
  final Displayer displayer;
  final Checker checker;
  final Actioner action;
  final String label;
  const FieldTile({
    @required this.displayer,
    this.checker,
    this.action,
    @required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
      child: ListTile(
        title: displayer,
        leading: action,
        trailing: checker,
        subtitle: Text(label),
      ),
    );
  }
}
