import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/data/datasource.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/data/repository_impl.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/domain/usecases/use_retrieve_user.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/cloud_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef ContextProvider = Widget Function(BuildContext context);

class CloudWrapper extends StatelessWidget {
  CloudWrapper({
    Key key,
    @required this.builder,
  }) : super(key: key);

  final ContextProvider builder;

  final nested = CloudRepositoryImpl(
    datasource: CloudDatasourceRemote(
      firebaseCloudInstance: FirebaseFirestore.instance,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: CloudBloc(
        useRetrieveUser: UseRetrieveUser(repository: nested),
      ),
      child: builder(context),
    );
  }
}
