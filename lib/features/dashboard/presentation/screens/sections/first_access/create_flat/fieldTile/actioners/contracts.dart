import 'package:flutter/material.dart';

typedef WithPreviousValueBuilder = Function(
  String previousValue,
);

typedef WithChoosenFeaturesBuilder = Function(
  BuildContext context,
  List<bool> choosenFeatures,
);

abstract class Actioner<FieldType> extends StatelessWidget {}

abstract class ActionerWithPrevious<FieldType> extends Actioner<FieldType> {
  final WithPreviousValueBuilder withPreviousValueBuilder;
  ActionerWithPrevious(this.withPreviousValueBuilder);
}

abstract class ActionerWithGenericFunction<FieldType>
    extends Actioner<FieldType> {
  final Function function;
  ActionerWithGenericFunction(this.function);
}
