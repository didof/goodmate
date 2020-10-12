import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_screen.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/checking_authentication_state_screen.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/dashboard_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GoodMate',
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CheckingAuthenticationStateScreen();
          }
          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              final User user = snapshot.data;
              // TODO save user in provider
              return DashboardScreen();
            } else {
              return AuthenticationScreen();
            }
          }
        },
      ),
    );
  }
}
