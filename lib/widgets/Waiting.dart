import 'package:flutter/material.dart';

class WaitingMessage extends StatelessWidget {
  final String message;
  const WaitingMessage({this.message});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          CircularProgressIndicator(),
          if (message != null) Text(message),
        ],
      ),
    );
  }
}
