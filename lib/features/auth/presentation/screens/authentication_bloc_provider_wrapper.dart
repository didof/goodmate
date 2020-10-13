import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/network/network_info.dart';
import 'package:flutter_architecture_scaffold/features/auth/data/datasources/authentication_datasource_remote.dart';
import 'package:flutter_architecture_scaffold/features/auth/data/repositories/authentication_impl.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_create_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_sign_in_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_sign_out.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ContextProvider = Widget Function(BuildContext context);

class AuthenticationBlocProviderWrapper extends StatelessWidget {
  final ContextProvider builder;

  AuthenticationBlocProviderWrapper({
    Key key,
    @required this.builder,
  }) : super(key: key);

  final nested = AuthenticationRepositoryImpl(
    networkInfoImpl: NetworkInfoImpl(
      dataConnectionChecker: DataConnectionChecker(),
    ),
    datasource: AuthenticationDatasourceRemote(
      firebaseAuthInstance: FirebaseAuth.instance,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: AuthenticationBloc(
        useCreateUserWithEmailAndPassword:
            UseCreateUserWithEmailAndPassword(repository: nested),
        useSignInUserWithEmailAndPassword:
            UseSignInUserWithEmailAndPassword(repository: nested),
        useSignOut: UseSignOut(repository: nested),
      ),
      child: Builder(builder: (context) => builder(context)),
    );
  }
}
