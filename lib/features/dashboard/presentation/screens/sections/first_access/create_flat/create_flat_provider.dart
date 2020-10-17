import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/field_types.dart';
import 'package:provider/provider.dart';

Either<InvalidField, FlatName> generateRandomFlatName() {
  return left(InvalidField('empty', invalidValue: ''));
}

class CreateFlatProvider with ChangeNotifier {
  Either<InvalidField, FlatName> flatName = generateRandomFlatName();

  setFlatName(String str) {
    flatName = validateFlatName(str);
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

Either<InvalidField, FlatName> validateFlatName(String str) {
  if (str == null)
    return left(InvalidField(
      'the name must not be null',
      invalidValue: str,
    ));
  if (str.isEmpty)
    return left(InvalidField(
      'the name must not be empty',
      invalidValue: str,
    ));
  if (str.length < 4)
    return left(InvalidField(
      'the name must be at least 4 characters',
      invalidValue: str,
    ));
  return right(FlatName(value: str));
}

typedef AccessibleProvider = Widget Function(
  BuildContext context,
  CreateFlatProvider provider,
  Widget child,
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
        return builder(context, provider, child);
      }),
    );
  }
}
