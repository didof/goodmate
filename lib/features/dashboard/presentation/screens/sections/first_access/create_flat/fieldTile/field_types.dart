import 'package:meta/meta.dart';

abstract class FieldType {
  final String value;
  FieldType({@required this.value});
}

class FlatNameType extends FieldType {
  final String value;
  FlatNameType({this.value});
}

class SecretKeyType extends FieldType {
  final String value;
  SecretKeyType({this.value});
}
