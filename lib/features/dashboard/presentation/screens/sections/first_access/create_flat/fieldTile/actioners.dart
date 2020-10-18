import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/field_types.dart';

typedef WithPreviousValueBuilder = Function(
  String previousValue,
);

abstract class Actioner<FieldType> extends StatelessWidget {}

abstract class ActionerWithPrevious<FieldType> extends Actioner<FieldType> {
  final WithPreviousValueBuilder withPreviousValueBuilder;
  ActionerWithPrevious(this.withPreviousValueBuilder);
}

abstract class ActionerWithGenericFunction<FieldType>
    extends Actioner<FieldType> {
  final Function function;
  ActionerWithGenericFunction(this.function);
}

class FlatNameActioner extends ActionerWithPrevious<FlatNameType> {
  final WithPreviousValueBuilder withPreviousValueBuilder;
  FlatNameActioner({@required WithPreviousValueBuilder builder})
      : withPreviousValueBuilder = builder,
        super(builder);

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CreateFlatProvider>(context).flatName;
    final ThemeData theme = Theme.of(context);
    return CircleAvatar(
      child: IconButton(
        color: theme.accentColor,
        splashColor: theme.primaryColor,
        icon: Icon(Icons.label),
        onPressed: () {
          return withPreviousValueBuilder(
            value.fold((l) => l.invalidValue, (r) => r.value),
          );
        },
      ),
    );
  }
}

class SecretKeyActioner extends ActionerWithPrevious<SecretKeyType> {
  final WithPreviousValueBuilder withPreviousValueBuilder;
  SecretKeyActioner({@required WithPreviousValueBuilder builder})
      : withPreviousValueBuilder = builder,
        super(builder);

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CreateFlatProvider>(context).secretKey;
    final ThemeData theme = Theme.of(context);
    return CircleAvatar(
      child: IconButton(
        color: theme.accentColor,
        splashColor: theme.primaryColor,
        icon: Icon(Icons.vpn_key),
        onPressed: () {
          return withPreviousValueBuilder(
            value.fold((l) => l.invalidValue, (r) => r.value),
          );
        },
      ),
    );
  }
}

class PartyLengthActioner extends ActionerWithGenericFunction<PartyLengthType> {
  PartyLengthActioner(Function function) : super(function);

  @override
  Widget build(BuildContext context) {
    final value = Provider.of<CreateFlatProvider>(context).partyLength;
    final ThemeData theme = Theme.of(context);
    return CircleAvatar(
      backgroundColor: theme.primaryColor,
      child: BadgePersons(value, theme: theme),
    );
  }
}

class BadgePersons extends StatelessWidget {
  final Either<InvalidField, PartyLengthType> value;
  final ThemeData theme;
  final double hideBadgeAt;
  BadgePersons(
    this.value, {
    @required this.theme,
    this.hideBadgeAt = 2,
  });

  @override
  Widget build(BuildContext context) {
    return value.fold((l) {
      return const Icon(Icons.error_outline);
    }, (r) {
      return LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              CircleAvatar(
                backgroundColor: theme.primaryColor,
                child: const Icon(
                  Icons.people_outline,
                ),
              ),
              if (r.value > hideBadgeAt)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      color: theme.accentColor,
                    ),
                    width: constraints.maxWidth / 2,
                    height: constraints.maxHeight / 2,
                    child: Text(
                      r.value.round().toString(),
                      style: TextStyle(color: Colors.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
            ],
          );
        },
      );
    });
  }
}

// TODO build its own actioner specific
class WantedFeatureActioner extends Actioner<WantedFeatureType> {
  final ThemeData theme;
  WantedFeatureActioner({@required this.theme});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: theme.primaryColor,
      child: IconButton(
        icon: const Icon(Icons.dashboard),
        onPressed: () => print('show modal with more extensive explanation'),
      ),
    );
  }
}
