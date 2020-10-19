import 'package:flutter/material.dart';

abstract class Displayer<FieldType> extends StatelessWidget {
  const Displayer();
}

abstract class StringDisplayer<StringFieldType> extends Displayer {
  final String value;
  const StringDisplayer({@required this.value});
}

abstract class IntDisplayer<IntFieldType> extends Displayer {
  final int value;
  const IntDisplayer({@required this.value});
}

abstract class ListOfBoolDisplayer<ListOfBoolFieldType> extends Displayer {
  const ListOfBoolDisplayer();
}
