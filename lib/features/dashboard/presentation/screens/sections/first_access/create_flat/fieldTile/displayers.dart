import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/show_snackbars.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/field_types.dart';
import 'package:provider/provider.dart';

abstract class Displayer<FieldType> extends StatelessWidget {}

class FlatNameDisplayer extends Displayer<FlatNameType> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final provider = Provider.of<CreateFlatProvider>(context);
    Either<InvalidField, FlatNameType> value = provider.flatName;
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

class SecretKeyDisplayer extends Displayer<SecretKeyType> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final provider = Provider.of<CreateFlatProvider>(context);
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
