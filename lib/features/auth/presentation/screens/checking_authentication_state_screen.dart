import 'package:flutter/material.dart';

class CheckingAuthenticationStateScreen extends StatelessWidget {
  const CheckingAuthenticationStateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text('Checking if already logged in ...'),
            LinearProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
