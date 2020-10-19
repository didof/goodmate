import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider_widgets.dart';
import 'package:flutter_architecture_scaffold/widgets/containerZero.dart';

class CreateFlatFAB extends StatelessWidget {
  const CreateFlatFAB();

  @override
  Widget build(BuildContext context) {
    return CFC(
      builder: (context, provider, child, theme) {
        // print(provider.isValid);
        if (provider.isValid)
          return FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: null,
          );
        else
          return const ContainerZero();
      },
    );
  }
}
