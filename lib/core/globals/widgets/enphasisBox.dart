import 'package:flutter/material.dart';

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
