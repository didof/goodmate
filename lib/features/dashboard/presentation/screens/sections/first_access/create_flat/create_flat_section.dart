import 'package:flutter/material.dart';

import 'package:flutter_architecture_scaffold/core/utils/show_modal.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/checkers.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/displayers.dart';
import 'package:flutter_architecture_scaffold/widgets/sectionTitle.dart';

class CreateFlatSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create a Flat'),
      ),
      body: CreateFlatProviderConsumer(
        builder: (context, provider, child) {
          return ListView(
            children: [
              SectionTitle('Create Flat Section'),
              ToupleDisplayerAction(
                displayer: FlatNameDisplayer(),
                checker: FlatnameChecker(fixErrorFunction: (invalidValue) {
                  showModalWithSingleTextField(
                    context,
                    labelText: 'Flat name',
                    title: 'Pick a Name for the Flat',
                    explanation:
                        'This is the name that will appear to you and the other mates.',
                    preText: invalidValue,
                  ).then((value) => provider.setFlatName(value));
                }),
                action: OutlineButton(
                  child: const Text('Select a Name'),
                  onPressed: () => showModalWithSingleTextField(
                    context,
                    labelText: 'Flat name',
                    title: 'Pick a Name for the Flat',
                    explanation:
                        'This is the name that will appear to you and the other mates.',
                  ).then((value) => provider.setFlatName(value)),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class ToupleDisplayerAction extends StatelessWidget {
  final Displayer displayer;
  final Checker checker;
  final Widget action;
  const ToupleDisplayerAction({
    @required this.displayer,
    @required this.checker,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: displayer,
        leading: action,
        trailing: checker,
      ),
    );
  }
}
