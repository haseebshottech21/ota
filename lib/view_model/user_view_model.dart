import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UsersViewModel with ChangeNotifier {
  // final _userRepo = UserServices();

  // Future<bool> saveUser(UserModel user) async {
  //   final SharedPreferences sp = await SharedPreferences.getInstance();
  //   sp.setString('token', user.token.toString());
  //   notifyListeners();
  //   return true;
  // }

  // Future<UserModel> getUser() async {
  //   final SharedPreferences sp = await SharedPreferences.getInstance();
  //   final String? token = sp.getString('token');
  //   return UserModel(
  //     token: token,
  //   );
  // }

  // Future<bool> remove() async {
  //   final SharedPreferences sp = await SharedPreferences.getInstance();
  //   sp.remove('token');
  //   return true;
  // }

}
