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

String generateRandomFlatName() {
  return 'fancy name';
}

Future showModalInfo(
  BuildContext context, {
  String title = "Some info",
  List<String> infos = const [],
}) async {
  final ThemeData theme = Theme.of(context);
  return await showDialog(
    context: context,
    child: SimpleDialog(
        title: TitleWithDismissable(title, theme: theme),
        titlePadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
        children: infos
            .map((info) => EnphasisBox(
                  info,
                  enphasis: Enphasis.Info,
                  theme: theme,
                ))
            .toList()),
  );
}

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

enum Enphasis {
  Info,
  Error,
}

class EnphasisBox extends StatelessWidget {
  final String str;
  final Enphasis enphasis;
  final ThemeData theme;
  EnphasisBox(
    this.str, {
    this.enphasis = Enphasis.Info,
    @required this.theme,
  });

  Color pickEnphasisColor() {
    switch (enphasis) {
      case Enphasis.Info:
        return theme.primaryColor;
      case Enphasis.Error:
      default:
        return theme.errorColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(color: pickEnphasisColor(), width: 3.0),
        ),
      ),
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.only(bottom: 8.0),
      child: Text(str),
    );
  }
}
