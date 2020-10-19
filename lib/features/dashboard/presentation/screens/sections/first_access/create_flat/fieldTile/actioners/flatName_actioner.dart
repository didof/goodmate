import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/actioners/contracts.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider_widgets.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';

class FlatNameActioner extends ActionerWithPrevious<FlatNameType> {
  final WithPreviousValueBuilder withPreviousValueBuilder;
  FlatNameActioner({
    @required WithPreviousValueBuilder action,
  })  : withPreviousValueBuilder = action,
        super(action);

  @override
  Widget build(BuildContext context) {
    return CFC(
      builder: (context, provider, child, theme) {
        return CircleAvatar(
          child: IconButton(
            color: theme.accentColor,
            splashColor: theme.primaryColor,
            icon: Icon(Icons.label),
            onPressed: () {
              return withPreviousValueBuilder(
                provider.flatName.fold(
                  (l) => l.invalidValue,
                  (r) => r.value,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
