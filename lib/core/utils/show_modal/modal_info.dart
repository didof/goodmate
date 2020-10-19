import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/globals/widgets/enphasisBox.dart';
import 'package:flutter_architecture_scaffold/core/globals/widgets/titleWithDismissable.dart';

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
