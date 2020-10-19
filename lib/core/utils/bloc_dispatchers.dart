import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/current_user_info_bloc.dart';

void dispatchAuthEvent(
    {BuildContext context, @required AuthenticationEvent event}) {
  BlocProvider.of<AuthenticationBloc>(context).add(event);
}

void dispatchCurrentUserInfoEvent(
  BuildContext context, {
  @required CurrentUserInfoEvent event,
}) {
  BlocProvider.of<CurrentUserInfoBloc>(context).add(event);
}
