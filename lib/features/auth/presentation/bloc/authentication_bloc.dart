import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/entities/failures.dart';
import 'package:flutter_architecture_scaffold/core/entities/params.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_create_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_sign_in_user_with_email_and_password.dart';
import 'package:flutter_architecture_scaffold/features/auth/domain/usecases/use_sign_out.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/authentication_methods.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/credentials_controller.dart';
import 'package:meta/meta.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UseCreateUserWithEmailAndPassword useCreateUserWithEmailAndPassword;
  final UseSignInUserWithEmailAndPassword useSignInUserWithEmailAndPassword;
  final UseSignOut useSignOut;

  AuthenticationBloc({
    @required this.useCreateUserWithEmailAndPassword,
    @required this.useSignInUserWithEmailAndPassword,
    @required this.useSignOut,
  }) : super(AuthenticationInitial(authMethod: DEFAULT_AUTH_METHOD));

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    yield AuthenticationInitial(authMethod: DEFAULT_AUTH_METHOD);
    if (event is TriggerCreateUserWithEmailAndPassword) {
      yield AuthenticationWaiting();
      final Either<Failure, UserCredential> user =
          await useCreateUserWithEmailAndPassword(
        CreateUserWithEmailAndPasswordParams(
          email: event.email,
          password: event.password,
        ),
      );
      yield* user.fold((l) async* {
        yield AuthenticationError(
          code: l.code,
          message: l.message,
        );
      }, (r) async* {
        yield AuthenticationSuccess(userCredential: r);
      });
    } else if (event is TriggerSignInUserWithEmailAndPassword) {
      yield AuthenticationWaiting();
      final Either<Failure, UserCredential> user =
          await useSignInUserWithEmailAndPassword(
        SignInUserWithEmailAndPasswordParams(
          email: event.email,
          password: event.password,
        ),
      );
      yield* user.fold((l) async* {
        yield AuthenticationError(
          code: l.code,
          message: l.message,
        );
      }, (r) async* {
        yield AuthenticationSuccess(userCredential: r);
      });
    } else if (event is TriggerSignout) {
      final User user = await useSignOut();
      print('current user $user');
      if (user == null) yield AuthenticationRedirectTo(AuthMethods.Signin);
    } else if (event is TriggerShiftToPage) {
      yield AuthenticationInitial(authMethod: event.authMethod);
    }
  }
}
