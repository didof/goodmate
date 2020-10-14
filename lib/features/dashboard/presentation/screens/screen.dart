import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/bloc_providers_methods.dart';
import 'package:flutter_architecture_scaffold/core/providers/user_cloud_info.dart';
import 'package:flutter_architecture_scaffold/core/utils/show_snackbars.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/all_features/all_features_screen.dart';

import 'package:flutter_architecture_scaffold/features/dashboard/presentation/widgets/Waiting.dart';
import 'package:flutter_architecture_scaffold/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/cloud_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/drawer.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/first_access_section.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CloudBloc>(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dashboard'),
        ),
        drawer: DashboardDrawer(),
        body: BlocConsumer<CloudBloc, CloudState>(
          listener: (context, state) {
            if (state.runtimeType is CloudError) {
              showErrorSnackbarFromCloudErrorState(
                context: context,
                state: state,
              );
            }
          },
          builder: (context, state) {
            switch (state.runtimeType) {
              // ? setup
              case CloudConnectToCloud:
                return _ConnectingToCloud();

              // ? loading
              case CloudWaiting:
                return WaitingIndicator(
                    message: (state as CloudWaiting).message);

              // * Success
              case CloudSuccessButFirstAccess:
                return FirstAccessSection();
              case CloudSuccessAndAlreadyTenantIn:
                return AllFeaturesScreen();

              // ! Error
              case CloudError:
              default:
                return _Error();
            }
          },
        ),
      ),
    );
  }
}

class _ConnectingToCloud extends StatefulWidget {
  const _ConnectingToCloud({Key key}) : super(key: key);

  @override
  __ConnectingToCloudState createState() => __ConnectingToCloudState();
}

class __ConnectingToCloudState extends State<_ConnectingToCloud> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final String uid = Provider.of<UserCloudInfo>(context, listen: false).uid;
      if (uid == null || uid.isEmpty) {
        throw UnimplementedError(
            '[DashobardScreen] this should never be thrown');
      }
      print('ehm');
      dispatchCloudEvent(context: context, event: TriggerRetrieveUser(id: uid));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const LinearProgressIndicator(),
        const Expanded(
          child: const Center(
            child:
                const Text('Checking if you already participate to some flat.'),
          ),
        ),
      ],
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String uid = Provider.of<UserCloudInfo>(context, listen: false).uid;
    return Column(
      children: [
        Text('Something went orribly wrong.'),
        FlatButton(
          child: Text(
            'Please, fix this.',
          ),
          onPressed: () => dispatchCloudEvent(
              context: context, event: TriggerRetrieveUser(id: uid)),
        )
      ],
    );
  }
}
