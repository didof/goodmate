import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/signin_screen.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/signup_screen.dart';

export 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/signup_screen.dart';
export 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/signin_screen.dart';

enum AuthMethods {
  Signup,
  Signin,
}

final Map<AuthMethods, Widget> authenticationMethods = {
  AuthMethods.Signup: SignupScreen(),
  AuthMethods.Signin: SigninScreen(),
};

List<Widget> mapAuthenticationMethods({
  List<AuthMethods> exceptFor,
  Widget Function(Widget) wrapChildrenWith,
}) {
  var methods = {...authenticationMethods};
  if (exceptFor != null) {
    exceptFor.forEach((exceptedMethod) {
      methods.remove(exceptedMethod);
    });
  }
  return methods.values.map((e) {
    if (wrapChildrenWith != null)
      return wrapChildrenWith(e);
    else
      return e;
  }).toList();
}
