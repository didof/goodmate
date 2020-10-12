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

  factory TriggerCreateUserWithEmailAndPassword(
      {@required CredentialsController credentials}) {
    return TriggerCreateUserWithEmailAndPassword._(
      email: credentials.email.text,
      password: credentials.password.text,
    );
  }
}
