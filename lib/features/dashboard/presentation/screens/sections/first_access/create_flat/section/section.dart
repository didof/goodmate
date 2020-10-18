import 'package:flutter/material.dart';

import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/section/flatName.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/section/partyLength.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/section/secretKey.dart';
import 'package:flutter_architecture_scaffold/widgets/sectionTitle.dart';

class CreateFlatSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Flat'),
      ),
      body: CreateFlatProviderConsumer(builder: (context, provider) {
        return ListView(
          children: [
            SectionTitle('Create Flat Section'),
            FlatName(provider),
            SecretKey(provider),
            PartyLength(provider),
          ],
        );
      }),
    );
  }
}
