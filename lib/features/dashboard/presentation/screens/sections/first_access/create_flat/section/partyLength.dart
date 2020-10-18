import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/show_modal.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/displayers.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/fieldTile.dart';

class PartyLength extends StatelessWidget {
  final CreateFlatProvider provider;
  PartyLength(this.provider);

  void _buildModal(BuildContext context) {
    showModalInfo(context, infos: [
      'You have to set a fixed amount of persons that will be able to access the Flat you are creating',
      'In future it will be added the possibility to extend the maximum number. To this day, it is fixed to 5 for database capacity limits.'
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return FieldTile(
      label: 'party length',
      displayer: PartyLengthDisplayer(),
      checker: PartyLengthChecker(moreInfoFunction: _buildModal),
      action: PartyLengthActioner(() {}),
    );
  }
}
