import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture_scaffold/core/utils/string_methods.dart';

class CurrentUser with ChangeNotifier {
  String uid;
  String email;
  String displayName;
  String theme;
  CurrentUser({
    this.uid,
    this.email,
    this.displayName,
    this.theme = 'light theme',
  });

  void updateCurrentUser(User user, [bool silently = true]) {
    uid = user.uid;
    email = user.email;
    displayName = user.displayName.isEmpty
        ? user.email.selectStrBefore('@').capitalizeFirstLetter()
        : user.displayName;
    if (!silently) notifyListeners();
  }

  void updateTheme(String themeChoice) {
    theme = themeChoice;
    notifyListeners();
  }
}
