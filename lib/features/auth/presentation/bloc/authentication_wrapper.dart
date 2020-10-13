import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/network/network_info.dart';
import 'package:flutter_architecture_scaffold/core/providers/instances.dart';
import 'package:flutter_architecture_scaffold/features/auth/data/datasource.dart';
import 'package:flutter_architecture_scaffold/features/auth/data/repository_impl.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_create_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_sign_in_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_sign_out.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

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
      firebaseCloudInstance: FirebaseFirestore.instance,
    ),
  );

  @override
  Widget build(BuildContext context) {
    final instances = Provider.of<Instances>(context, listen: false);

    final datasource = AuthenticationDatasourceRemote(
      firebaseAuthInstance: instances.firebaseAuth,
      firebaseCloudInstance: instances.firebaseFirestore,
    );

    return BlocProvider.value(
      value: AuthenticationBloc(
        useCreateUserWithEmailAndPassword: UseCreateUserWithEmailAndPassword(
          repository: AuthenticationRepositoryImpl(
            networkInfoImpl: NetworkInfoImpl(
              dataConnectionChecker: DataConnectionChecker(),
            ),
            datasource: datasource,
          ),
        ),
        useSignInUserWithEmailAndPassword: UseSignInUserWithEmailAndPassword(
          repository: AuthenticationRepositoryImpl(
            networkInfoImpl: NetworkInfoImpl(
              dataConnectionChecker: DataConnectionChecker(),
            ),
            datasource: datasource,
          ),
        ),
        useSignOut: UseSignOut(
          repository: AuthenticationRepositoryImpl(
            networkInfoImpl: NetworkInfoImpl(
              dataConnectionChecker: DataConnectionChecker(),
            ),
            datasource: datasource,
          ),
        ),
      ),
      child: Builder(
        builder: (context) => builder(context),
      ),
    );
  }
}
