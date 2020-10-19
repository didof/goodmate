import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';

String generateFlatName() {
  return 'myRandomFlat';
}

Either<InvalidField, FlatNameType> generateRandomFlatNameInstance() {
  return right(FlatNameType(value: generateFlatName()));
}

Either<InvalidField, SecretKeyType> generateRandomSecretKeyInstance() {
  return right(SecretKeyType(value: 'shhhhh'));
}

Either<InvalidField, PartyLengthType> generatePartyLengthInstance({
  double initialValue = 3.0,
}) {
  return right(PartyLengthType(value: initialValue));
}

Either<InvalidField, WantedFeatureType> generateWantedFeaturesInstance() {
  var list = List.generate(3, (index) {
    if (index == 0) return true;
    return false;
  });

  return Right(WantedFeatureType(values: list));
}

class CreateFlatProvider with ChangeNotifier {
  Either<InvalidField, FlatNameType> flatName =
      generateRandomFlatNameInstance();
  Either<InvalidField, SecretKeyType> secretKey =
      generateRandomSecretKeyInstance();
  Either<InvalidField, PartyLengthType> partyLength =
      generatePartyLengthInstance();
  Either<InvalidField, WantedFeatureType> wantedFeatures =
      generateWantedFeaturesInstance();

  setFlatName(String str) {
    flatName = validateFlatName(str);
    notifyListeners();
  }

  setSecretKey(String str) {
    secretKey = validateSecretKey(str);
    notifyListeners();
  }

  setPartyLength(double number) {
    print(number);
    partyLength = right(PartyLengthType(value: number));
    notifyListeners();
  }

  setWantedFeatures(int index) {
    print(index);
    wantedFeatures =
        validateWantedFeatures(index, list: [...wantedFeaturesList]);
    notifyListeners();
  }

  // getters
  List<Either<InvalidField, FieldType>> get props =>
      [flatName, secretKey, partyLength];

  List<bool> get wantedFeaturesList => [
        ...wantedFeatures.fold((_) => List.generate(3, (_) => false), (r) {
          return r.values;
        })
      ];
}

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
  return right(WantedFeatureType(values: list));
}
