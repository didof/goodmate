import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_architecture_scaffold/core/failures.dart';
import 'package:flutter_architecture_scaffold/core/usecases/params.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_create_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_sign_in_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/signup_screen.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UseCreateUserWithEmailAndPassword useCreateUserWithEmailAndPassword;
  final UseSignInUserWithEmailAndPassword useSignInUserWithEmailAndPassword;

  AuthenticationBloc({
    @required this.useCreateUserWithEmailAndPassword,
    @required this.useSignInUserWithEmailAndPassword,
  }) : super(AuthenticationInitial());

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield AuthenticationInitial();
    if (event is TriggerCreateUserWithEmailAndPassword) {
      yield AuthenticationWaiting();
      final Either<CreateUserFailure, UserCredential> user =
          await useCreateUserWithEmailAndPassword(
        CreateUserWithEmailAndPasswordParams(
          email: event.email,
          password: event.password,
        ),
      );
      yield* user.fold((l) async* {
        yield AuthenticationError(message: l.message);
      }, (r) async* {
        yield AuthenticationSuccess(userCredential: r);
      });
    }
  }
}
