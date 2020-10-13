import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/redirectTo.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_bloc_provider_wrapper.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/credentials_controller.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/signin_screen.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key key}) : super(key: key);

  _buildErrorSnackbar({
    @required BuildContext context,
    @required AuthenticationError state,
  }) {
    final ScaffoldState scaffoldState = Scaffold.of(context);
    SnackBar snackbar = SnackBar(content: Text(state.message));
    if (state.code == 'email-already-in-use') {
      snackbar = SnackBar(
        content: Text(state.message),
        action: SnackBarAction(
          label: 'signin',
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return SigninScreen();
                },
              ),
            );
          },
        ),
      );
    }
    return scaffoldState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return AuthenticationBlocProviderWrapper(
      builder: (context) => Scaffold(
        body: BlocConsumer<AuthenticationBloc, AuthenticationState>(
          listener: (BuildContext context, AuthenticationState state) {
            switch (state.runtimeType) {
              case AuthenticationError:
                _buildErrorSnackbar(context: context, state: state);
                break;
              case AuthenticationSuccess:
                redirectTo(context: context, screen: DashboardScreen());
            }
          },
          builder: (BuildContext context, AuthenticationState state) {
            switch (state.runtimeType) {
              case AuthenticationWaiting:
                return Center(child: CircularProgressIndicator());
              case AuthenticationSuccess:
                return _Successful();
              case AuthenticationInitial:
              case AuthenticationError:
              default:
                return _Initial();
            }
          },
        ),
      ),
    );
  }
}

class _Initial extends StatelessWidget {
  _Initial({Key key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();
  final CredentialsController _credentialsController = CredentialsController();

  void _dispatchRegisterEvent(BuildContext context) {
    BlocProvider.of<AuthenticationBloc>(context).add(
      TriggerCreateUserWithEmailAndPassword(
        credentials: _credentialsController,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'e-mail'),
              controller: _credentialsController.email,
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'password'),
              controller: _credentialsController.password,
            ),
            FlatButton.icon(
              icon: Icon(Icons.person_add),
              label: Text('Sign up'),
              onPressed: () => _dispatchRegisterEvent(context),
            ),
            FlatButton(
              child: Text('I already have an account'),
              onPressed: () => redirectTo(
                context: context,
                screen: SigninScreen(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _Successful extends StatelessWidget {
  const _Successful({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        LinearProgressIndicator(),
        Text('Successfully authenticated. You are being redirected.'),
      ],
    );
  }
}
