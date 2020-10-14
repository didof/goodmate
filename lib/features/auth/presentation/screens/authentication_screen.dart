import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/screens/authentication_methods/authentication_methods.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key key}) : super(key: key);

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
            AuthenticationBody(theme)
          ],
        ),
      ),
    );
  }
}

class AuthenticationBody extends StatefulWidget {
  final ThemeData theme;
  AuthenticationBody(this.theme, {Key key}) : super(key: key);

  @override
  _AuthenticationBodyState createState() => _AuthenticationBodyState();
}

class _AuthenticationBodyState extends State<AuthenticationBody> {
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildCard(Widget child) {
    return Card(
      margin: const EdgeInsets.all(32.0),
      child: child,
    );
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
}
