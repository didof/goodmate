import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/field_types.dart';

abstract class Displayer<FieldType> extends StatelessWidget {}

abstract class StringDisplayer<StringFieldType> extends Displayer {
  final String value;
  StringDisplayer({@required this.value});
}

abstract class IntDisplayer<IntFieldType> extends Displayer {
  final int value;
  IntDisplayer({@required this.value});
}

abstract class ListOfBoolDisplayer<ListOfBoolFieldType> extends Displayer {}

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

const featuresIcons = const [
  const Icon(Icons.chat),
  const Icon(Icons.calendar_today),
  const Icon(Icons.shopping_cart),
];

class WantedFeaturesDisplayer extends ListOfBoolDisplayer<WantedFeatureType> {
  final ThemeData theme;
  final CreateFlatProvider provider;
  WantedFeaturesDisplayer({@required this.theme, @required this.provider});

  @override
  Widget build(BuildContext context) {
    return provider.wantedFeatures.fold(
      (l) {
        return ToggleWantedFeatures(
          list: List.generate(3, (_) => false),
          provider: provider,
          theme: theme,
        );
        return ToggleButtons(
          children: featuresIcons,
          isSelected: List.generate(3, (_) => false),
          onPressed: (index) => provider.setWantedFeatures(index),
        );
      },
      (r) {
        return ToggleWantedFeatures(
          list: r.values,
          provider: provider,
          theme: theme,
        );
      },
    );
  }
}

class ToggleWantedFeatures extends StatelessWidget {
  final List<bool> list;
  final ThemeData theme;
  final CreateFlatProvider provider;
  const ToggleWantedFeatures({
    @required this.list,
    @required this.theme,
    @required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: featuresIcons,
      isSelected: list,
      color: Colors.grey,
      selectedColor: theme.accentColor,
      fillColor: theme.primaryColor,
      splashColor: theme.accentColor,
      renderBorder: false,
      onPressed: (index) => provider.setWantedFeatures(index),
    );
  }
}
