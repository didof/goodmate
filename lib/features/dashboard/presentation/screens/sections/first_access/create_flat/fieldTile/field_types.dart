import 'package:meta/meta.dart';

abstract class FieldType {
  final dynamic value;
  FieldType({@required this.value});
}

abstract class StringFieldType extends FieldType {
  final String value;
  StringFieldType({@required this.value});
}

abstract class DoubleFieldType extends FieldType {
  final double value;
  DoubleFieldType({@required this.value});
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
