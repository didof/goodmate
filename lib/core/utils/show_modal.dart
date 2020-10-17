import 'package:flutter/material.dart';

Future showModalWithSingleTextField(
  BuildContext context, {
  String title = 'Please digit below',
  String explanation,
  String labelText = 'fill here',
  String preText,
}) async {
  final ThemeData theme = Theme.of(context);
  return await showDialog(
    context: context,
    builder: (context) {
      String str;
      return AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            IconButton(
              color: theme.errorColor,
              icon: const Icon(Icons.close),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (explanation != null && explanation.isNotEmpty)
              Text(explanation),
            TextField(
              decoration: InputDecoration(labelText: labelText),
              autofocus: true,
              onChanged: (value) {
                str = value;
              },
            ),
          ],
        ),
        actions: [
          OutlineButton.icon(
            onPressed: () => Navigator.of(context).pop(str),
            icon: const Icon(Icons.check),
            label: const Text('I like this'),
          ),
        ],
        insetPadding: const EdgeInsets.all(8.0),
      );
    },
    useSafeArea: true,
  );
}
