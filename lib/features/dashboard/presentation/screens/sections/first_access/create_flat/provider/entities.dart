import 'package:meta/meta.dart';

class InvalidField {
  final String invalidValue;
  final String shortMessage;
  final String message;
  InvalidField(
    this.message, {
    this.shortMessage = 'required',
    this.invalidValue,
  });
}

abstract class FieldType {
  final dynamic value;
  const FieldType({@required this.value});
}

abstract class StringFieldType extends FieldType {
  final String value;
  const StringFieldType({@required this.value});
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
  final List<bool> value;
  WantedFeatureType({@required this.value});
}
