import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/current_user_info_bloc.dart';
import 'package:flutter_architecture_scaffold/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef StateListener = void Function(
  BuildContext context,
  CurrentUserInfoState state,
);

typedef StateBuilder = Widget Function(
  BuildContext context,
  CurrentUserInfoState state,
);

class CurrentUserInfoProvider extends StatelessWidget {
  final Widget child;
  const CurrentUserInfoProvider({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<CurrentUserInfoBloc>(),
      child: child,
    );
  }
}

class CurrentUserInfoProviderValue extends StatelessWidget {
  final Widget child;
  const CurrentUserInfoProviderValue({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<CurrentUserInfoBloc>(),
      child: child,
    );
  }
}

class CurrentUserInfoConsumer extends StatelessWidget {
  final StateListener listenerForwarder;
  final StateBuilder builderForwarder;
  final Widget child;
  const CurrentUserInfoConsumer({
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
      return BlocListener<CurrentUserInfoBloc, CurrentUserInfoState>(
        listener: (context, state) {
          listenerForwarder(context, state);
        },
        child: child,
      );
    return BlocConsumer<CurrentUserInfoBloc, CurrentUserInfoState>(
      listener: (context, state) {
        listenerForwarder(context, state);
      },
      builder: (context, state) {
        return builderForwarder(context, state);
      },
    );
  }
}
