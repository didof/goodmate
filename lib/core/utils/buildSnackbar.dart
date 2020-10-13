import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';

buildErrorSnackbarFromAuthenticationErrorState({
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
