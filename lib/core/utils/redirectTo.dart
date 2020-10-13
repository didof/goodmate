import 'package:flutter/material.dart';

void redirectTo(
    {@required BuildContext context, @required StatelessWidget screen}) {
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    ),
  );
}
