import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/providers/instances.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/widgets/Waiting.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'package:flutter_architecture_scaffold/core/utils/navigateTo.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_wrapper.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/cloud_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/cloud_wrapper.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/drawer.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/welcome_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  void _dispatchSignOutEvent(BuildContext context) async {
    BlocProvider.of<AuthenticationBloc>(context).add(TriggerSignout());
  }

  @override
  Widget build(BuildContext context) {
    return CloudWrapper(
      builder: (context) {
        return AuthenticationBlocProviderWrapper(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Dashboard'),
                actions: [
                  IconButton(
                    icon: const Icon(Icons.exit_to_app),
                    onPressed: () => _dispatchSignOutEvent(context),
                  )
                ],
              ),
              drawer: DashboardDrawer(),
              body: BlocBuilder<CloudBloc, CloudState>(
                builder: (context, state) {
                  switch (state.runtimeType) {
                    case CloudInitial:
                      return _Initial();
                    case CloudWaiting:
                      return WaitingIndicator();
                    case CloudSuccess:
                      return AvaiableFlat(
                        (state as CloudSuccess).documentSnapshot,
                      );
                    case CloudError:
                    default:
                      return Text('cloud error');
                  }
                },
              ),
            );
          },
        );
      },
    );
  }
}

class _Initial extends StatefulWidget {
  const _Initial({Key key}) : super(key: key);

  @override
  __InitialState createState() => __InitialState();
}

class __InitialState extends State<_Initial> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      final Instances instances =
          Provider.of<Instances>(context, listen: false);
      final String uid = instances.firebaseAuth.currentUser.uid;
      BlocProvider.of<CloudBloc>(context).add(TriggerRetrieveUser(id: uid));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LinearProgressIndicator(),
        Text('I am retrieving your flats'),
      ],
    );
  }
}

class AvaiableFlat extends StatelessWidget {
  final DocumentSnapshot doc;
  const AvaiableFlat(
    this.doc, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (doc.data().containsKey('tenantIn')) {
      return ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text('flat number ' + (index + 1).toString()));
        },
      );
    } else {
      return WelcomeScreen();
    }
  }
}
