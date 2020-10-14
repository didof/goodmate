import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/buildSnackbar.dart';
import 'package:flutter_architecture_scaffold/core/utils/navigateTo.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_methods.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/authentication_methods.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/credentials_controller.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/signup_screen.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';

class SigninScreen extends StatelessWidget {
  SigninScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
        listener: (BuildContext context, AuthenticationState state) {
          switch (state.runtimeType) {
            case AuthenticationError:
              buildErrorSnackbarFromAuthenticationErrorState(
                context: context,
                state: state,
                destinationScreen: SignupScreen(),
              );
              break;
            case AuthenticationSuccess:
              replaceTo(context, screen: DashboardScreen());
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
    );
  }
}

class _Initial extends StatelessWidget {
  _Initial({Key key}) : super(key: key);

  final GlobalKey<FormState> _formKey = GlobalKey();
  final CredentialsController _credentialsController = CredentialsController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                icon: Icon(Icons.accessibility_new),
                label: Text('Sign in'),
                onPressed: () => dispatchAuthEvent(
                  context: context,
                  event: TriggerSignInUserWithEmailAndPassword(
                    credentials: _credentialsController,
                  ),
                ),
              ),
              FlatButton(
                child: Text('I need to create an account'),
                onPressed: () => dispatchAuthEvent(
                  context: context,
                  event: TriggerShiftToPage(
                    AuthMethods.Signup,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _Successful extends StatelessWidget {
  const _Successful({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          LinearProgressIndicator(),
          Text('Successfully authenticated. You are being redirected.'),
        ],
      ),
    );
  }
}
