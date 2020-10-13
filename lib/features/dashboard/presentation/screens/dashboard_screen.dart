import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_bloc_provider_wrapper.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatefulWidget {
  final User user;
  const DashboardScreen({
    Key key,
    this.user,
  }) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  void _dispatchSignOutEvent() {
    BlocProvider.of<AuthenticationBloc>(context).add(TriggerSignout());
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationBlocProviderWrapper(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: _dispatchSignOutEvent,
            )
          ],
        ),
        drawer: DashboardDrawer(),
        body: Center(
          child: Text('Successfull'),
        ),
      ),
    );
  }
}
