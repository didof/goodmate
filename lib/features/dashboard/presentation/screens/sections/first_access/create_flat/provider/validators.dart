import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';

Either<InvalidField, FlatNameType> validateFlatName(String str) {
  if (str == null || str.isEmpty)
    return left(InvalidField(
      'The name must not be empty',
      invalidValue: str,
    ));
  if (str.length < 4)
    return left(InvalidField(
      'The name must be at least 4 characters',
      invalidValue: str,
    ));
  if (str.length > 20)
    return left(InvalidField(
      'The name must be less than 20 characters',
      invalidValue: str,
    ));
  return right(FlatNameType(value: str));
}

Either<InvalidField, SecretKeyType> validateSecretKey(String str) {
  if (str == null || str.isEmpty)
    return left(InvalidField(
      'The name must not be empty',
      invalidValue: str,
    ));
  if (str.length < 4)
    return left(InvalidField(
      'The name must be at least 8 characters',
      invalidValue: str,
    ));
  if (str.length > 10)
    return left(InvalidField(
      'The name must be less than 20 characters',
      invalidValue: str,
    ));
  return right(SecretKeyType(value: str));
}

Either<InvalidField, WantedFeatureType> validateWantedFeatures(
  int index, {
  @required List<bool> list,
}) {
  list[index] = !list[index];
  if (list.every((element) => element == false))
    return left(InvalidField('you must pick at least one feature'));
  return right(WantedFeatureType(value: list));
}
