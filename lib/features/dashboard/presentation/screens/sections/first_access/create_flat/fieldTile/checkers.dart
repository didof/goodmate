import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/field_types.dart';
import 'package:provider/provider.dart';

typedef ErrorFunction = Function(
  String errorMessage,
);

abstract class Checker<FieldType> extends StatelessWidget {
  final ErrorFunction fixErrorFunction;
  Checker({@required this.fixErrorFunction});
}

class FlatnameChecker extends Checker<FlatNameType> {
  final ErrorFunction fixErrorFunction;
  FlatnameChecker({@required this.fixErrorFunction});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Either<InvalidField, FlatNameType> value =
        Provider.of<CreateFlatProvider>(context).flatName;
    return value.fold(
      (l) {
        return IconButton(
          color: theme.errorColor,
          splashColor: theme.accentColor,
          icon: Icon(Icons.error_outline),
          onPressed: () =>
              fixErrorFunction('${l.invalidValue} is not valid. ${l.message}'),
          tooltip: l.message.toString(),
        );
      },
      (r) {
        return const Icon(
          Icons.check_circle_outline,
        );
      },
    );
  }
}

class SecretKeyChecker extends Checker<SecretKeyType> {
  final ErrorFunction fixErrorFunction;
  SecretKeyChecker({@required this.fixErrorFunction});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final Either<InvalidField, SecretKeyType> value =
        Provider.of<CreateFlatProvider>(context).secretKey;
    return value.fold(
      (l) {
        return IconButton(
          color: theme.errorColor,
          splashColor: theme.accentColor,
          icon: Icon(Icons.error_outline),
          onPressed: () =>
              fixErrorFunction('${l.invalidValue} is not valid. ${l.message}'),
          tooltip: l.message.toString(),
        );
      },
      (r) {
        return const Icon(
          Icons.check_circle_outline,
        );
      },
    );
  }
}