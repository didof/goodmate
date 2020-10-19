import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/providers/authenticated_user_widgets.dart';
import 'package:flutter_architecture_scaffold/core/utils/bloc_dispatchers.dart';
import 'package:flutter_architecture_scaffold/core/utils/navigator_methods.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/entities/create_flat_parameters.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/current_user_info_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/screen.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider_widgets.dart';
import 'package:flutter_architecture_scaffold/widgets/containerZero.dart';

class CreateFlatFAB extends StatelessWidget {
  const CreateFlatFAB();

  @override
  Widget build(BuildContext context) {
    String uid;
    return AUIConsumer(
      builder: (context, provider) {
        uid = provider.uid;
        return CFC(
          builder: (context, provider, child, theme) {
            print(provider.validatedValues);
            if (provider.isValid)
              return FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () {
                  replaceTo(context, screen: DashboardScreen());
                  dispatchCurrentUserInfoEvent(
                    context,
                    event: TriggerCreateFlat(
                      parameters: CreateFlatParameters(
                        adminUid: uid,
                        flatName: provider.validatedValues['flatName'],
                        secretKey: provider.validatedValues['secretKey'],
                        partyLength: provider.validatedValues['partyLength'],
                        features: provider.validatedValues['wantedFeatures'],
                      ),
                    ),
                  );
                },
              );
            else
              return const ContainerZero();
          },
        );
      },
    );
  }
}
