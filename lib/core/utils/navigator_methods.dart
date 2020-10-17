import 'package:flutter/material.dart';

void pushTo(
  BuildContext context, {
  @required Widget screen,
}) {
  final NavigatorState navigatorState = Navigator.of(context);
  navigatorState.push(
    MaterialPageRoute(builder: (context) {
      return screen;
    }),
  );
}

void replaceTo(
  BuildContext context, {
  @required Widget screen,
}) {
  final NavigatorState navigatorState = Navigator.of(context);
  navigatorState.pushReplacement(
    MaterialPageRoute(
      builder: (context) {
        return screen;
      },
    ),
  );
}

// TODO apply different animations to different methods
