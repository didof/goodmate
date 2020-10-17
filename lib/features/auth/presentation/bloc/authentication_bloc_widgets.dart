import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef StateListener = void Function(
  BuildContext context,
  AuthenticationState state,
);

typedef StateBuilder = Widget Function(
  BuildContext context,
  AuthenticationState state,
);

class AuthenticationBlocProvider extends StatelessWidget {
  final Widget child;
  const AuthenticationBlocProvider({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<AuthenticationBloc>(),
      child: child,
    );
  }
}

class AuthenticationBlocConsumer extends StatelessWidget {
  final StateListener listenerForwarder;
  final StateBuilder builderForwarder;
  final Widget child;
  const AuthenticationBlocConsumer({
    Key key,
    StateListener listener,
    StateBuilder builder,
    this.child,
  })  : listenerForwarder = listener,
        builderForwarder = builder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    if (child != null)
      return BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          listenerForwarder(context, state);
        },
        child: child,
      );
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        listenerForwarder(context, state);
      },
      builder: (context, state) {
        return builderForwarder(context, state);
      },
    );
  }
}
