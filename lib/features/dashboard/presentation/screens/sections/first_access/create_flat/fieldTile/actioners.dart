import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/field_types.dart';
import 'package:provider/provider.dart';

typedef WithPreviousValueBuilder = Function(
  String previousValue,
);

abstract class Actioner<FieldType> extends StatelessWidget {
  final WithPreviousValueBuilder withPreviousValueBuilder;
  Actioner(this.withPreviousValueBuilder);
}

class FlatNameAction extends Actioner<FlatNameType> {
  final WithPreviousValueBuilder withPreviousValueBuilder;
  FlatNameAction({@required WithPreviousValueBuilder builder})
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
        icon: Icon(Icons.edit),
        onPressed: () {
          return withPreviousValueBuilder(
            value.fold((l) => l.invalidValue, (r) => r.value),
          );
        },
      ),
    );
  }
}

class SecretKeyAction extends Actioner<SecretKeyType> {
  final WithPreviousValueBuilder withPreviousValueBuilder;
  SecretKeyAction({@required WithPreviousValueBuilder builder})
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
        icon: Icon(Icons.edit),
        onPressed: () {
          return withPreviousValueBuilder(
            value.fold((l) => l.invalidValue, (r) => r.value),
          );
        },
      ),
    );
  }
}
