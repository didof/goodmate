import 'package:flutter/material.dart';

//TODO find a way to use an AppBar from different file
class DashboardAppBar extends StatelessWidget {
  const DashboardAppBar({Key key}) : super(key: key);

  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
      title: const Text('Dashboard'),
    );
  }
}
