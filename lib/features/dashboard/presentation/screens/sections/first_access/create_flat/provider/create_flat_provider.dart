import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/entities.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/provider/validators.dart';

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

  return Right(WantedFeatureType(value: list));
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
    partyLength = right(PartyLengthType(value: number));
    notifyListeners();
  }

  setWantedFeatures(int index) {
    wantedFeatures =
        validateWantedFeatures(index, list: [...wantedFeaturesList]);
    notifyListeners();
  }

  getFieldInstance(Either<InvalidField, FieldType> value) {
    return value.fold((l) => l, (r) => r);
  }

  _calculateIsValid() {
    return props.map((field) {
      return getFieldInstance(field);
    }).every((instance) => !(instance is InvalidField));
  }

  // getters
  List<Either<InvalidField, FieldType>> get props =>
      [flatName, secretKey, partyLength, wantedFeatures];

  List<bool> get wantedFeaturesList => [
        ...wantedFeatures.fold(
          (_) => List.generate(3, (_) => false),
          (r) {
            return r.value;
          },
        )
      ];

  bool get isValid => _calculateIsValid();
}
