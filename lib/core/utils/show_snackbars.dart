import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/bloc/current_user_info_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/checkers.dart';

showErrorSnackbarFromAuthenticationErrorState({
  @required BuildContext context,
  @required AuthenticationError state,
  @required Widget destinationScreen,
}) {
  final ScaffoldState scaffoldState = Scaffold.of(context);
  SnackBar snackbar = SnackBar(content: Text(state.message));
  if (state.code == 'email-already-in-use') {
    snackbar = SnackBar(
      content: Text(state.message),
      action: SnackBarAction(
        label: 'signin',
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return destinationScreen;
              },
            ),
          );
        },
      ),
    );
  }
  return scaffoldState.showSnackBar(snackbar);
}

showErrorSnackbarFromCloudErrorState({
  @required BuildContext context,
  @required CloudError state,
  Function exec,
  Duration doExecAfter = const Duration(seconds: 2),
}) {
  final ScaffoldState scaffoldState = Scaffold.of(context);
  SnackBar snackbar = SnackBar(content: Text(state.message));
  print('showErrorSnackbarFromCloudErrorState:${state.code} - implement me');
  Future.delayed(doExecAfter, exec);
  return scaffoldState.showSnackBar(snackbar);
}

throwInfoSnackbar(
  BuildContext context, {
  @required String message,
}) async {
  final snackbar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 3),
    backgroundColor: Theme.of(context).errorColor,
  );

  Scaffold.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(snackbar);
}
