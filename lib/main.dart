import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

import 'package:flutter_architecture_scaffold/core/providers/authenticated_user.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc_widgets.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_screen.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/screen.dart';
import 'package:flutter_architecture_scaffold/widgets/Waiting.dart';

import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await di.setup();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticatedUser>(
            create: (_) => AuthenticatedUser()),
      ],
      builder: (context, child) {
        return AuthenticationBlocProvider(
          child: CustomMaterialApp(
            stream: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                // show spinner while connecting to firebase
                if (snapshot.connectionState == ConnectionState.waiting)
                  return WaitingMessage(
                      message: 'Checking if already logged in ...');

                // when connected, if user is already authenticated send him forward
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData) {
                  Provider.of<AuthenticatedUser>(context)
                      .updateUserCloudInfo(snapshot.data);
                  return DashboardScreen();
                }

                // otherwise send him to auth
                return AuthenticationScreen();
              },
            ),
          ),
        );
      },
    );
  }
}

/// TODO create CustomMaterialApp
/// create in [CustomMaterialApp] a field providers that only takes the labels
// class BlocProviders {
//   final List<String> list;
//   BlocProviders._({this.list});

//   factory BlocProviders({@required List<String> list}) {
//     const accettableLabels = const ['authentication', 'cloud'];
//     accettableLabels.forEach((accettable) {
//       list.any((label) => label ==);
//     });
//   }
// }

class CustomMaterialApp extends StatelessWidget {
  final StreamBuilder<User> stream;
  const CustomMaterialApp({
    Key key,
    @required this.stream,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoodMate',
      debugShowCheckedModeBanner: false,
      home: stream,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
