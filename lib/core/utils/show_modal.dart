import 'package:flutter/material.dart';

Future showModalWithSingleTextField(
  BuildContext context, {
  String title = 'Please digit below',
  String explanation,
  String labelText = 'fill here',
  String errorMessage,
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
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (explanation != null && explanation.isNotEmpty)
                Text(explanation),
              if (errorMessage != null)
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    errorMessage,
                    style: TextStyle(color: theme.errorColor),
                  ),
                ),
              TextField(
                decoration: InputDecoration(labelText: labelText),
                autofocus: true,
                onChanged: (value) {
                  str = value;
                },
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.cake),
            color: theme.accentColor,
            splashColor: theme.primaryColor,
            onPressed: () =>
                Navigator.of(context).pop(generateRandomFlatName()),
          ),
          OutlineButton.icon(
            icon: const Icon(Icons.check),
            label: const Text('I like this'),
            splashColor: theme.accentColor,
            onPressed: () => Navigator.of(context).pop(str),
          ),
        ],
        insetPadding: const EdgeInsets.all(8.0),
      );
    },
    useSafeArea: true,
  );
}

String generateRandomFlatName() {
  return 'fancy name';
}
