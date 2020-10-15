import 'package:flutter/material.dart';

class ThirdStep extends StatelessWidget {
  const ThirdStep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const Text('3'),
          const Text('[Explanation]'),
        ],
      ),
    );
  }
}
