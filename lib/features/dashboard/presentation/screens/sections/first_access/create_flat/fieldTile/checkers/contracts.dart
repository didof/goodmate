import 'package:flutter/material.dart';

typedef ErrorFunction = Function(
  String errorMessage,
);

abstract class Checker<FieldType> extends StatelessWidget {
  final ErrorFunction fixErrorFunction;
  Checker({@required this.fixErrorFunction});
}
