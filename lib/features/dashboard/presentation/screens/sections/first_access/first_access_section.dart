import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/utils/navigator_methods.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/create_flat/section/section.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/first_access/join_flat.dart';

class FirstAccessSection extends StatefulWidget {
  FirstAccessSection({Key key}) : super(key: key);

  @override
  _FirstAccessSectionState createState() => _FirstAccessSectionState();
}

class _FirstAccessSectionState extends State<FirstAccessSection> {
  PageController _pageController = PageController(initialPage: 1);

  void shiftTo(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      children: [
        _CreateFlatLander(),
        Welcome(shiftTo),
        JoinFlat(),
      ],
    );
  }
}

class Welcome extends StatelessWidget {
  final Function(int index) shiftTo;
  const Welcome(this.shiftTo, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('GOODMATE'),
            const Text(
                'It seems this is the first time you are using this App. Its goal is to easily administrate the coexistence of flatmates. In order to perform my function I need you to belong to at least one room.'),
            FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.chevron_left),
                  const Text('Create a Flat'),
                ],
              ),
              onPressed: () => shiftTo(0),
            ),
            FlatButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.chevron_right),
                  const Text('Join a Flat'),
                ],
              ),
              onPressed: () => shiftTo(2),
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateFlatLander extends StatelessWidget {
  const _CreateFlatLander({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Create a Flat'),
          const Text('[Explain]'),
          FlatButton.icon(
            onPressed: () => pushTo(context, screen: CreateFlatSection()),
            icon: const Icon(Icons.home),
            label: const Text('Start'),
          ),
        ],
      ),
    );
  }
}
