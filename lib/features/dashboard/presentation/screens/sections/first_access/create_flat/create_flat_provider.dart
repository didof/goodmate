import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/fieldTile/field_types.dart';
import 'package:provider/provider.dart';

Either<InvalidField, FlatNameType> generateRandomFlatName() {
  return right(FlatNameType(value: 'myRandomFlat'));
}

Either<InvalidField, SecretKeyType> generateRandomSecretKey() {
  return right(SecretKeyType(value: 'shhhhh'));
}

class CreateFlatProvider with ChangeNotifier {
  Either<InvalidField, FlatNameType> flatName = generateRandomFlatName();
  Either<InvalidField, SecretKeyType> secretKey = generateRandomSecretKey();

  setFlatName(String str) {
    flatName = validateFlatName(str);
    notifyListeners();
  }

  setSecretKey(String str) {
    secretKey = validateSecretKey(str);
    notifyListeners();
  }
}

class InvalidField {
  final String invalidValue;
  final String shortMessage;
  final String message;
  InvalidField(
    this.message, {
    this.shortMessage = 'required',
    @required this.invalidValue,
  });
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

typedef AccessibleProvider = Widget Function(
  BuildContext context,
  CreateFlatProvider provider,
);

class CreateFlatProviderConsumer extends StatelessWidget {
  final AccessibleProvider builder;
  final Widget child;
  CreateFlatProviderConsumer({
    @required this.builder,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CreateFlatProvider(),
      child: Builder(builder: (context) {
        final provider =
            Provider.of<CreateFlatProvider>(context, listen: false);
        print('provider was built again');
        return builder(context, provider);
      }),
    );
  }
}
