import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/field_types.dart';
import 'package:provider/provider.dart';

abstract class Displayer<FieldType> extends StatelessWidget {}

abstract class StringDisplayer<StringFieldType> extends Displayer {}

abstract class IntDisplayer<IntFieldType> extends Displayer {}

class FlatNameDisplayer extends StringDisplayer<FlatNameType> {
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

class SecretKeyDisplayer extends StringDisplayer<SecretKeyType> {
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

class PartyLengthDisplayer extends IntDisplayer<PartyLengthType> {
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final provider = Provider.of<CreateFlatProvider>(context);
    Either<InvalidField, PartyLengthType> value = provider.partyLength;
    return value.fold(
      (l) {
        return Text(
          l.shortMessage.toString(),
          style: TextStyle(color: theme.errorColor),
        );
      },
      (r) {
        return Slider(
          value: r.value,
          onChanged: (value) {
            provider.setPartyLength(value);
          },
          label: r.value.round().toString(),
          min: 2,
          max: 8,
          divisions: 6,
        );
      },
    );
  }
}
