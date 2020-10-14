import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/providers/current_user.dart';
import 'package:flutter_architecture_scaffold/core/providers/instances.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_screen.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/checking_authentication_state_screen.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/signup_screen.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/screen.dart';
import 'package:provider/provider.dart';

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
        ChangeNotifierProvider<CurrentUser>(create: (_) => CurrentUser()),
        ChangeNotifierProvider<Instances>(
          create: (_) => Instances(
            firebaseAuth: FirebaseAuth.instance,
            firebaseFirestore: FirebaseFirestore.instance,
          ),
        ),
      ],
      builder: (context, child) {
        final instances = Provider.of<Instances>(context, listen: false);
        return MaterialApp(
          title: 'GoodMate',
          debugShowCheckedModeBanner: false,
          home: StreamBuilder(
            stream: instances.firebaseAuth.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
              print('changed $snapshot');
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CheckingAuthenticationStateScreen();
              }
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return DashboardScreen();
                }
              }
              return AuthenticationScreen();
            },
          ),
        );
      },
    );
  }
}
