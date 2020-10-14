import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/signin_screen.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/signup_screen.dart';
import 'package:flutter_architecture_scaffold/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => sl<AuthenticationBloc>(),
          child: SignupScreen(),
        ),
      ),
    );
  }
}
