import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ota/model/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UsersViewModel with ChangeNotifier {
  // final _userRepo = UserServices();

  Future<bool> saveUser(UserModel user) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', user.token.toString());
    sp.setString('userName', user.userName.toString());
    notifyListeners();
    return true;
  }

  Future<UserModel> getUser() async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    final String? token = sp.getString('token');
    final String? userName = sp.getString('userName');
    return UserModel(
      token: token.toString(),
      userName: userName.toString(),
    );
  }
}
