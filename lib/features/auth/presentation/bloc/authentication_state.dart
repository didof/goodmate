part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {
  final AuthMethods authMethod;
  AuthenticationInitial({@required this.authMethod});
}

class AuthenticationWaiting extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String code;
  final String message;
  AuthenticationError({
    @required this.code,
    @required this.message,
  });
}

class AuthenticationSuccess extends AuthenticationState {
  final UserCredential userCredential;
  AuthenticationSuccess({@required this.userCredential});
}

class AuthenticationRedirectTo extends AuthenticationState {
  final AuthMethods authMethod;
  AuthenticationRedirectTo(this.authMethod);
}
