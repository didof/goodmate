import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/bloc_providers_methods.dart';
import 'package:flutter_architecture_scaffold/core/providers/user_cloud_info.dart';
import 'package:flutter_architecture_scaffold/core/utils/navigate_to.dart';
import 'package:flutter_architecture_scaffold/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter_architecture_scaffold/features/dashboard/presentation/screens/sections/profile_section/profile_section.dart';
import 'package:provider/provider.dart';

class DashboardDrawer extends StatelessWidget {
  const DashboardDrawer({
    Key key,
  }) : super(key: key);

  void _closeDrawer(BuildContext context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          AppBar(
            title: Consumer<UserCloudInfo>(builder: (context, value, child) {
              return Text(value.displayName ?? value.email);
            }),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(Icons.chevron_left),
                onPressed: () => _closeDrawer(context),
              )
            ],
          ),
          ListTile(
            leading: const CircleAvatar(
              child: const Icon(Icons.account_circle),
            ),
            title: const Text('Profile'),
            subtitle: const Text('Add some info about you'),
            onTap: () => pushTo(
              context,
              screen: ProfileSection(),
            ),
          ),
          ListTile(
            leading: const CircleAvatar(
              child: const Icon(Icons.exit_to_app),
            ),
            title: const Text(
              'Sign Out',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () => dispatchAuthEvent(
              context: context,
              event: TriggerSignout(),
            ),
          )
        ],
      ),
    );
  }
}
