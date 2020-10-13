import 'package:flutter/material.dart';

class CheckingAuthenticationStateScreen extends StatelessWidget {
  const CheckingAuthenticationStateScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            LinearProgressIndicator(),
            Text('Checking if already logged in ...'),
          ],
        ),
      ),
    );
  }
}
