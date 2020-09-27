import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:usta/models/users.dart';
import 'package:usta/services/login_api.dart';

class Authentication with ChangeNotifier {
  String _userName;
  String _password;
  Users _user;

  Users get user => _user;

  bool isAuthenticated(String userName, String password) {
    bool result = false;

    if (user == null) {
      return false;
    }

    if (userName == _user.userName && password == _user.password) {
      result = true;
    }
    return result;
  }

  Future<void> callLoginAPI(String userName, String password) async {
    try {
      final UserLoginAPI login_api = UserLoginAPI();
      _user = await login_api.fetchUser(userName, password);
      print(
          'login_provider.dart#isAuthenticated: userName value from API ${_user.userName}');
      print(
          'login_provider.dart#isAuthenticated: Password value from API ${_user.password}');

      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
