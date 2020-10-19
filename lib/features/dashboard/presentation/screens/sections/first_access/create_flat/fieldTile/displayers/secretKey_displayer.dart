import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';

import 'contracts.dart';

class SecretKeyDisplayer extends StringDisplayer<SecretKeyType> {
  final CreateFlatProvider provider;
  final ThemeData theme;
  SecretKeyDisplayer(this.provider, this.theme);

  @override
  Widget build(BuildContext context) {
    Either<InvalidField, SecretKeyType> value = provider.secretKey;

    return value.fold(
      (l) {
        return Text(
          l.shortMessage.toString(),
          style: TextStyle(color: theme.errorColor),
        );
      },
      (r) {
        return Text(
          r.value.toString(),
          style: TextStyle(color: theme.primaryColor),
        );
      },
    );
  }
}