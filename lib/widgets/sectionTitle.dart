import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String str;
  SectionTitle(this.str);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        str,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: theme.primaryColor,
          fontSize: 20,
        ),
      ),
    );
  }
}
