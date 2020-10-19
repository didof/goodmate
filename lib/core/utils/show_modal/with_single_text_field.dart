import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/globals/widgets/enphasisBox.dart';
import 'package:flutter_architecture_scaffold/core/globals/widgets/titleWithDismissable.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/create_flat_provider.dart';

Future showModalWithSingleTextField(
  BuildContext context,
  ThemeData theme, {
  String title = 'Please digit below',
  String explanation,
  String labelText = 'fill here',
  String errorMessage,
}) async {
  await showDialog(
    context: context,
    builder: (context) {
      String str;
      return AlertDialog(
        title: TitleWithDismissable(title, theme: theme),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(labelText: labelText),
                autofocus: true,
                onChanged: (value) {
                  str = value;
                },
              ),
              if (explanation != null && explanation.isNotEmpty)
                Text(explanation),
              if (errorMessage != null)
                EnphasisBox(
                  errorMessage,
                  theme: theme,
                  enphasis: Enphasis.Error,
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
