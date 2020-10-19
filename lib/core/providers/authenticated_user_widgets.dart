import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import 'authenticated_user.dart';

typedef AuthenticatedBuilder = Widget Function(
  BuildContext context,
  AuthenticatedUser provider,
);

class AUIConsumer extends StatelessWidget {
  final AuthenticatedBuilder builder;
  const AUIConsumer({@required this.builder});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AuthenticatedUser>(context);
    return builder(context, provider);
  }
}
