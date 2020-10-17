import 'package:meta/meta.dart';

abstract class FieldType {
  final String value;
  FieldType({@required this.value});
}

class FlatName extends FieldType {
  final String value;
  FlatName({this.value});
}
