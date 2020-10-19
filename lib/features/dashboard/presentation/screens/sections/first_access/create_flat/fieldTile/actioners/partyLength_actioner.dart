import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners/contracts.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/widgets/badgeIcon.dart';

class PartyLengthActioner extends ActionerWithGenericFunction<PartyLengthType> {
  final CreateFlatProvider provider;
  final ThemeData theme;
  PartyLengthActioner(this.provider, this.theme, {@required Function action})
      : super(action);

  @override
  Widget build(BuildContext context) {
    final value = provider.partyLength;

    return CircleAvatar(
      backgroundColor: theme.primaryColor,
      child: BadgeIcon(value, theme: theme),
    );
  }
}
