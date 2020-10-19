import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider_widgets.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/section/flatName.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/section/partyLength.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/section/secretKey.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/section/wantedFeatures.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/widgets/floatingActionButton.dart';
import 'package:flutter_architecture_scaffold/widgets/sectionTitle.dart';

enum Features {
  Chat,
  CleaningSchedule,
  GroceryShopping,
}

class CreateFlatSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CFP(builder: (context, child) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Create a Flat'),
        ),
        body: ListView(
          children: [
            SectionTitle('Create Flat Section'),
            FlatName(),
            SecretKey(),
            PartyLength(),
            WantedFeatures(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CreateFlatFAB(),
      );
    });
  }
}
