import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';

import 'contracts.dart';

class PartyLengthDisplayer extends IntDisplayer<PartyLengthType> {
  final CreateFlatProvider provider;
  final ThemeData theme;
  PartyLengthDisplayer(this.provider, this.theme);

  @override
  Widget build(BuildContext context) {
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