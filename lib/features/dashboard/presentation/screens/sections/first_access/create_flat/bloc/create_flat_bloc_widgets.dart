import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/bloc/create_flat_bloc.dart';

typedef StateListener = void Function(
  BuildContext context,
  CreateFlatState state,
);

typedef StateBuilder = Widget Function(
  BuildContext context,
  CreateFlatState state,
);

typedef StateBuilderPage = Widget Function(
  BuildContext context,
  CreateFlatPageState state,
);

typedef StateBuilderFirst = Widget Function(
  BuildContext context,
  CreateFlatFirst state,
);

typedef StateBuilderSecond = Widget Function(
  BuildContext context,
  CreateFlatSecond state,
);

typedef StateBuilderThird = Widget Function(
  BuildContext context,
  CreateFlatThird state,
);

class CreateFlatBlocPack extends StatelessWidget {
  final StateListener listenerForwarder;
  final StateBuilder builderForwarder;
  final Widget child;

  const CreateFlatBlocPack({
    Key key,
    StateListener listener,
    StateBuilder builder,
    this.child,
  })  : listenerForwarder = listener,
        builderForwarder = builder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateFlatBloc(),
      child: Builder(
        builder: (context) {
          if (child != null)
            return BlocListener<CreateFlatBloc, CreateFlatState>(
              listener: (context, state) {
                listenerForwarder(context, state);
              },
              child: child,
            );

          return BlocConsumer<CreateFlatBloc, CreateFlatState>(
            listener: (context, state) {
              listenerForwarder(context, state);
            },
            builder: (context, state) {
              return builderForwarder(context, state);
            },
          );
        },
      ),
    );
  }
}

class CreateFlatBuilder extends StatelessWidget {
  final StateBuilderPage builderForwarder;
  const CreateFlatBuilder({
    Key key,
    StateBuilderPage builder,
  })  : builderForwarder = builder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateFlatBloc, CreateFlatState>(
      builder: (context, state) {
        return builderForwarder(context, state);
      },
    );
  }
}
