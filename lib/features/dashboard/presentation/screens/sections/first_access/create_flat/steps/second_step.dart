import 'package:flutter/material.dart';

class SecondStep extends StatefulWidget {
  const SecondStep({Key key}) : super(key: key);

  @override
  _SecondStepState createState() => _SecondStepState();
}

class _SecondStepState extends State<SecondStep> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const Text('old 2'),
        ],
      ),
    );
  }
}
