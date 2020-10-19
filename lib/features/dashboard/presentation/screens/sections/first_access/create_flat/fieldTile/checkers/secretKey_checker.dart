import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/widgets/correctIcon.dart';

import 'contracts.dart';

class SecretKeyChecker extends Checker<SecretKeyType> {
  final CreateFlatProvider provider;
  final ThemeData theme;
  final ErrorFunction fixErrorFunction;
  SecretKeyChecker(
    this.provider,
    this.theme, {
    @required this.fixErrorFunction,
  });

  @override
  Widget build(BuildContext context) {
    final Either<InvalidField, SecretKeyType> value = provider.secretKey;

    return value.fold(
      (l) {
        return IconButton(
          color: theme.errorColor,
          splashColor: theme.accentColor,
          icon: const Icon(Icons.error_outline),
          onPressed: () =>
              fixErrorFunction('${l.invalidValue} is not valid. ${l.message}'),
          tooltip: l.message.toString(),
        );
      },
      (r) => const CorrectIcon(),
    );
  }
}