import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/navigator_methods.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc_widgets.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_screen.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/current_user_info_widgets.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/scaffold_components/body.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/scaffold_components/drawer.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AuthenticationBlocConsumer(
      listener: (context, state) {
        if (state is AuthenticationRedirectTo)
          replaceTo(context,
              screen: AuthenticationScreen(authMethod: state.authMethod));
      },
      child: CurrentUserInfoProvider(
        child: Scaffold(
          appBar: AppBar(title: const Text('Dashboard')),
          drawer: DashboardDrawer(),
          body: DashboardBody(),
        ),
      ),
    );
  }
}
