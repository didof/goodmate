import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';
import 'package:provider/provider.dart';

typedef AccessibleProvider = Widget Function(
  BuildContext context,
  Widget child,
);

class CFP extends StatelessWidget {
  final AccessibleProvider builder;
  const CFP({@required this.builder});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateFlatProvider(),
      builder: (context, child) {
        return builder(context, child);
      },
    );
  }
}

typedef ConsumerBuilder = Widget Function(
  BuildContext context,
  CreateFlatProvider provider,
  Widget child,
  ThemeData theme,
);

class CFC extends StatelessWidget {
  final ConsumerBuilder builder;
  const CFC({@required this.builder});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Consumer<CreateFlatProvider>(
      builder: (context, value, child) {
        return builder(context, value, child, theme);
      },
    );
  }
}
