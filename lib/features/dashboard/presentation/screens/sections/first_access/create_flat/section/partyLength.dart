import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/show_modal/modal_info.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners/partyLength_actioner.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers/partyLength_checker.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/displayers/partyLength_displayer.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/fieldTile.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider_widgets.dart';

class PartyLength extends StatelessWidget {
  const PartyLength();

  void _buildModal(BuildContext context) {
    showModalInfo(context, infos: [
      'You have to set a fixed amount of persons that will be able to access the Flat you are creating',
      'In future it will be added the possibility to extend the maximum number. To this day, it is fixed to 5 for database capacity limits.'
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CFC(
      builder: (context, provider, child, theme) {
        return FieldTile(
          label: 'party length',
          displayer: PartyLengthDisplayer(provider, theme),
          checker: PartyLengthChecker(provider, theme,
              moreInfoFunction: _buildModal),
          action: PartyLengthActioner(provider, theme, action: () {}),
        );
      },
    );
  }
}
