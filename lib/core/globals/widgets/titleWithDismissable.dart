import 'package:flutter/material.dart';

class TitleWithDismissable extends StatelessWidget {
  final ThemeData theme;
  final String title;
  TitleWithDismissable(this.title, {@required this.theme});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
        IconButton(
          color: theme.errorColor,
          icon: const Icon(Icons.close),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
    );
  }
}
