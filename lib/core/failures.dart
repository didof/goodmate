abstract class Failure {}

class AuthenticationFailure extends Failure {}

class CreateUserFailure extends AuthenticationFailure {
  final String message;
  CreateUserFailure({this.message});
}

class SignInUserFailure extends AuthenticationFailure {
  final String message;
  SignInUserFailure({this.message});
}
