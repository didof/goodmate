part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class TriggerCreateUserWithEmailAndPassword extends AuthenticationEvent {
  final String email;
  final String password;
  TriggerCreateUserWithEmailAndPassword._({
    @required this.email,
    @required this.password,
  });

  factory TriggerCreateUserWithEmailAndPassword({
    @required CredentialsController credentials,
  }) {
    return TriggerCreateUserWithEmailAndPassword._(
      email: credentials.email.text,
      password: credentials.password.text,
    );
  }
}

class TriggerSignInUserWithEmailAndPassword extends AuthenticationEvent {
  final String email;
  final String password;
  TriggerSignInUserWithEmailAndPassword._({
    @required this.email,
    @required this.password,
  });

  factory TriggerSignInUserWithEmailAndPassword({
    @required CredentialsController credentials,
  }) {
    return TriggerSignInUserWithEmailAndPassword._(
      email: credentials.email.text,
      password: credentials.password.text,
    );
  }
}

class TriggerSignout extends AuthenticationEvent {}

class TriggerShiftToPage extends AuthenticationEvent {
  final int indexPage;
  TriggerShiftToPage(this.indexPage);
}
