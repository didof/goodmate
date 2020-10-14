import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_architecture_scaffold/core/utils/string_methods.dart';

class UserCloudInfo with ChangeNotifier {
  String uid;
  String email;
  String displayName;
  String theme;
  UserCloudInfo({
    this.uid,
    this.email,
    this.displayName,
    this.theme = 'light theme',
  });

  List get _props => [uid, email, displayName, theme];

  void _printDebugProps() {
    final map = {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'theme': theme,
    };
    map.forEach((key, value) {
      print('$key:{$value}');
    });
  }

  void printProps() {
    _props.forEach((element) {
      print(element.toString());
    });
  }

  void updateUserCloudInfo(User user) {
    uid = user.uid;
    email = user.email;
    displayName = user.displayName == null
        ? user.email.selectStrBefore('@').capitalizeFirstLetter()
        : user.displayName;
    _printDebugProps();
  }

  void notifyListeners() {
    notifyListeners();
  }

  void updateTheme(String themeChoice) {
    theme = themeChoice;
    notifyListeners();
  }
}
