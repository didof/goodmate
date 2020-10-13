import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/providers/current_user.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/checking_authentication_state_screen.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/signup_screen.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:provider/provider.dart';

import 'features/auth/presentation/screens/authentication_bloc_provider_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrentUser>(create: (_) => CurrentUser()),
      ],
      builder: (context, child) => MaterialApp(
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
                Provider.of<CurrentUser>(context)
                    .updateCurrentUser(snapshot.data);
                return DashboardScreen();
              } else {
                return SignupScreen();
              }
            }
          },
        ),
      ),
    );
  }
}
