import 'package:flutter/material.dart';

class WaitingIndicator extends StatelessWidget {
  final String message;
  const WaitingIndicator({this.message});

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
