import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/providers/current_user.dart';
import 'package:flutter_architecture_scaffold/core/providers/instances.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_screen.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/checking_authentication_state_screen.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/signup_screen.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/screen.dart';
import 'package:flutter_architecture_scaffold/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
        return BlocProvider(
          create: (context) => sl<AuthenticationBloc>(),
          child: MaterialApp(
            title: 'GoodMate',
            debugShowCheckedModeBanner: false,
            home: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
                // show spinner while connecting to firebase
                if (snapshot.connectionState == ConnectionState.waiting)
                  return CheckingAuthenticationStateScreen();
                // when connected, if user is already authenticated send him forward
                if (snapshot.connectionState == ConnectionState.active &&
                    snapshot.hasData) return DashboardScreen();
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
