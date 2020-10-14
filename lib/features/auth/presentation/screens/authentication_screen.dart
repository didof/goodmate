import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/authentication_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationScreen extends StatelessWidget {
  final AuthMethods authMethod;
  const AuthenticationScreen({
    Key key,
    this.authMethod = AuthMethods.Signup,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              color: theme.primaryColor,
            ),
            AuthenticationBody(
              theme,
              authMethod: authMethod,
            )
          ],
        ),
      ),
    );
  }
}

class AuthenticationBody extends StatefulWidget {
  final ThemeData theme;
  final AuthMethods authMethod;
  AuthenticationBody(
    this.theme, {
    this.authMethod,
    Key key,
  }) : super(key: key);

  @override
  _AuthenticationBodyState createState() => _AuthenticationBodyState();
}

class _AuthenticationBodyState extends State<AuthenticationBody> {
  PageController _pageController;

  @override
  void initState() {
    _pageController =
        PageController(initialPage: _getInitialPage(widget.authMethod));
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  int _getInitialPage(AuthMethods authMethod) {
    int initialPage;
    switch (authMethod) {
      case AuthMethods.Signin:
        initialPage = 1;
        break;
      case AuthMethods.Signup:
      default:
        initialPage = 0;
    }
    return initialPage;
  }

  void _shiftToPage(AuthMethods authMethod) {
    _pageController.animateToPage(
      authenticationMethodsList.indexOf(authMethod),
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationInitial) {
          _shiftToPage(state.authMethod);
        }
      },
      child: PageView(
        controller: _pageController,
        children: mapAuthenticationMethods(wrapChildrenWith: _buildCard),
      ),
    );
  }

  Widget _buildCard(Widget child) {
    return Card(
      margin: const EdgeInsets.all(32.0),
      child: child,
    );
  }
}
