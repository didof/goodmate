part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationWaiting extends AuthenticationState {}

class AuthenticationError extends AuthenticationState {
  final String message;
  AuthenticationError({@required this.message});
}

class AuthenticationSuccess extends AuthenticationState {
  final UserCredential userCredential;
  AuthenticationSuccess({@required this.userCredential});
}
