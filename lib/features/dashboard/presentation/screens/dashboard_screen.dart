import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_bloc_provider_wrapper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  void _dispatchSignOutEvent(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(TriggerSignout());
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationBlocProviderWrapper(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () => _dispatchSignOutEvent(context),
            )
          ],
        ),
        body: Center(
          child: Text('Successfull'),
        ),
      ),
    );
  }
}
