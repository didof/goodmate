import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/field_types.dart';

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
      (r) => const CorrectIcon(),
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
      (r) => const CorrectIcon(),
    );
  }
}

class PartyLengthChecker extends Checker<PartyLengthType> {
  final Function(BuildContext context) moreInfoFunction;
  PartyLengthChecker({@required this.moreInfoFunction});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return IconButton(
      color: theme.primaryColor,
      icon: Icon(Icons.info_outline),
      onPressed: () => moreInfoFunction(context),
    );
  }
}

class WantedFeatureChecker extends Checker<WantedFeatureType> {
  final ThemeData theme;
  final CreateFlatProvider provider;
  WantedFeatureChecker({
    @required this.theme,
    @required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return provider.wantedFeatures.fold(
      (l) {
        return IconButton(
          color: theme.errorColor,
          splashColor: theme.accentColor,
          icon: Icon(Icons.error_outline),
          onPressed: () => provider.setWantedFeatures(0),
          tooltip: l.message.toString(),
        );
      },
      (r) => const CorrectIcon(),
    );
  }
}

class CorrectIcon extends StatelessWidget {
  const CorrectIcon();
  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.check_circle_outline,
      color: Colors.green,
    );
  }
}
