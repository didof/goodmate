import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/widgets/party_length_slider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/widgets/flat_name_text_field.dart';

class FirstStep extends StatelessWidget {
  final double appBarHeight;
  final TextEditingController nameController;
  final FocusNode partyLengthFocusNode;
  const FirstStep({
    Key key,
    @required this.nameController,
    @required this.appBarHeight,
    @required this.partyLengthFocusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Container(
        height: height - 64.0 - appBarHeight,
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text('Create a Flat'),
            const Text(
                'In this section you are going to create a Flat. You will be the admin of it.'),
            FlatNameTextField(controller: nameController),
            PartyLengthSlider(focusNode: partyLengthFocusNode),
          ],
        ),
      ),
    );
  }
}
