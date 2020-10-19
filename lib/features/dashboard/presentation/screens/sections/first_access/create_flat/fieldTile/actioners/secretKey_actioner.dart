import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners/contracts.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';

class SecretKeyActioner extends ActionerWithPrevious<SecretKeyType> {
  final WithPreviousValueBuilder withPreviousValueBuilder;
  final ThemeData theme;
  final CreateFlatProvider provider;
  SecretKeyActioner({
    @required WithPreviousValueBuilder builder,
    @required this.theme,
    @required this.provider,
  })  : withPreviousValueBuilder = builder,
        super(builder);

  @override
  Widget build(BuildContext context) {
    final value = provider.secretKey;

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
