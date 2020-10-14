import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/cloud_bloc.dart';

void dispatchAuthEvent({BuildContext context, AuthenticationEvent event}) {
  BlocProvider.of<AuthenticationBloc>(context).add(event);
}

void dispatchCloudEvent({BuildContext context, CloudEvent event}) {
  BlocProvider.of<CloudBloc>(context).add(event);
}
