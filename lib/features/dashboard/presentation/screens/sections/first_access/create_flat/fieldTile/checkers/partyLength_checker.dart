import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers/contracts.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';

class PartyLengthChecker extends Checker<PartyLengthType> {
  final CreateFlatProvider provider;
  final ThemeData theme;
  final Function(BuildContext context) moreInfoFunction;
  PartyLengthChecker(
    this.provider,
    this.theme, {
    @required this.moreInfoFunction,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: theme.primaryColor,
      icon: const Icon(Icons.info_outline),
      onPressed: () => moreInfoFunction(context),
    );
  }
}