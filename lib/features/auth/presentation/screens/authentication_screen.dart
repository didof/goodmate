import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/data/datasources/authentication_datasource_remote.dart';
import 'package:flutter_architecture_scaffold/features/auth/data/repositories/authentication_impl.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_create_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_sign_in_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/signup_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthenticationBloc(
        useCreateUserWithEmailAndPassword: UseCreateUserWithEmailAndPassword(
          repository: AuthenticationRepositoryImpl(
            datasource: AuthenticationDatasourceRemote(
              firebaseAuthInstance: FirebaseAuth.instance,
            ),
          ),
        ),
        useSignInUserWithEmailAndPassword: UseSignInUserWithEmailAndPassword(
          repository: AuthenticationRepositoryImpl(
            datasource: AuthenticationDatasourceRemote(
              firebaseAuthInstance: FirebaseAuth.instance,
            ),
          ),
        ),
      ),
      child: Scaffold(
        body: SignupScreen(),
      ),
    );
  }
}
