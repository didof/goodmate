import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';

Either<InvalidField, FlatNameType> generateRandomFlatName() {
  return right(FlatNameType(value: 'myRandomFlat'));
}

Either<InvalidField, SecretKeyType> generateRandomSecretKey() {
  return right(SecretKeyType(value: 'shhhhh'));
}

Either<InvalidField, PartyLengthType> generatePartyLength({
  double initialValue = 3.0,
}) {
  return right(PartyLengthType(value: initialValue));
}

Either<InvalidField, WantedFeatureType> generateWantedFeatures() {
  var list = List.generate(3, (index) {
    if (index == 0) return true;
    return false;
  });

  return Right(WantedFeatureType(values: list));
}

class CreateFlatProvider with ChangeNotifier {
  Either<InvalidField, FlatNameType> flatName = generateRandomFlatName();
  Either<InvalidField, SecretKeyType> secretKey = generateRandomSecretKey();
  Either<InvalidField, PartyLengthType> partyLength = generatePartyLength();
  Either<InvalidField, WantedFeatureType> wantedFeatures =
      generateWantedFeatures();

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
  if (str.length > 10)
    return left(InvalidField(
      'The name must be less than 10 characters',
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
