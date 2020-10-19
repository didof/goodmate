import 'package:flutter/material.dart';
import 'package:flutter_architecture_scaffold/core/providers/authenticated_user.dart';
import 'package:provider/provider.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('About me (working on)',
                      style: TextStyle(fontSize: 18)),
                  ListTile(
                    leading: const CircleAvatar(child: const Icon(Icons.face)),
                    title: const Text('display name'),
                    subtitle: Consumer<AuthenticatedUser>(
                      builder: (context, value, child) {
                        return Text(value.displayName);
                      },
                    ),
                    trailing:
                        IconButton(icon: Icon(Icons.edit), onPressed: null),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                        child: const Icon(Icons.alternate_email)),
                    title: const Text('e-mail address'),
                    subtitle: Consumer<AuthenticatedUser>(
                      builder: (context, value, child) {
                        return Text(
                          value.email,
                          overflow: TextOverflow.fade,
                          softWrap: true,
                        );
                      },
                    ),
                    trailing:
                        IconButton(icon: Icon(Icons.edit), onPressed: null),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Preferences (not yet implemented)',
                      style: TextStyle(fontSize: 18)),
                  ListTile(
                    leading:
                        const CircleAvatar(child: const Icon(Icons.color_lens)),
                    title: const Text('Theme'),
                    subtitle: Consumer<AuthenticatedUser>(
                      builder: (context, value, child) {
                        return Text(value.theme);
                      },
                    ),
                    trailing: IconButton(
                        icon: Icon(Icons.settings_brightness), onPressed: null),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Security (not yet implemented)',
                      style: TextStyle(fontSize: 18)),
                  ListTile(
                    leading:
                        const CircleAvatar(child: const Icon(Icons.security)),
                    title: const Text('change password'),
                    trailing: IconButton(
                        icon: Icon(Icons.chevron_right), onPressed: null),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
