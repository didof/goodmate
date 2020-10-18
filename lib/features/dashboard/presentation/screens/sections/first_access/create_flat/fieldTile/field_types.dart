import 'package:meta/meta.dart';

abstract class FieldType {}

abstract class StringFieldType extends FieldType {
  final String value;
  StringFieldType({@required this.value});
}

abstract class DoubleFieldType extends FieldType {
  final double value;
  DoubleFieldType({@required this.value});
}

abstract class ListFieldType<Type> extends FieldType {
  final List<Type> values;
  ListFieldType({@required this.values});
}

class FlatNameType extends StringFieldType {
  final String value;
  FlatNameType({@required this.value});
}

class SecretKeyType extends StringFieldType {
  final String value;
  SecretKeyType({@required this.value});
}

class PartyLengthType extends DoubleFieldType {
  final double value;
  PartyLengthType({@required this.value});
}

class WantedFeatureType extends ListFieldType<bool> {
  final List<bool> values;
  WantedFeatureType({@required this.values});
}
