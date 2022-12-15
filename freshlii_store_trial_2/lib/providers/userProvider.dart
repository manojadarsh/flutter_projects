import 'package:flutter/material.dart';
import 'package:freshlii_store_trial_2/models/user.dart';
import 'package:freshlii_store_trial_2/services/shared_preferences/userPreferences.dart';

class UserProvider with ChangeNotifier {
  User _user = new User();

  User get user => _user;

  void setUser(User user) {
    _user = user;
    UserPreferences().saveUser(user);
    notifyListeners();
  }

  void getUser () {
       UserPreferences().getUser().then((result) {
      _user = result;
    });
       //return _user;
  }

  void logOutUser() {
    _user = null;
    UserPreferences().removeUser();
    notifyListeners();
  }

}