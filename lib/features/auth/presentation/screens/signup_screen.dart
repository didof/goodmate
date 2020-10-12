import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case AuthenticationInitial:
            return _Initial();
          case AuthenticationWaiting:
            return Center(child: CircularProgressIndicator());
          case AuthenticationSuccess:
            return _Successful();
          case AuthenticationError:
            return _Error();
        }
      },
    );
  }
}

class CredentialsController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
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
    return Form(
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
            label: Text('Register'),
            onPressed: () => _dispatchRegisterEvent(context),
          ),
        ],
      ),
    );
  }
}

class _Successful extends StatelessWidget {
  const _Successful({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Authenticated, you are being redirected!'),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error'),
    );
  }
}
