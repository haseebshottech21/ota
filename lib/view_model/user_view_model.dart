import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ota/model/user_error.dart';
import 'package:ota/repo/app_status.dart';
import 'package:ota/repo/user_services.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import '../model/user_model.dart';

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

  bool _loading = false;
  List<UserModel> _userListModel = [];
  late UserError _userError;

  bool get loading => _loading;
  List<UserModel> get userListModel => _userListModel;
  UserError get userError => _userError;

  // UsersViewModel() {
  //   getUsers();
  // }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setUserListModel(List<UserModel> userListModel) {
    _userListModel = userListModel;
  }

  setUserError(UserError userError) {
    _userError = userError;
  }

  getUsers() async {
    setLoading(true);
    var response = await UserServices.getUserApi();
    // print(response);
    if (response is Success) {
      // print('Success');
      setUserListModel(response.response as List<UserModel>);
    }
    if (response is Failure) {
      UserError userError = UserError(
        code: response.code,
        message: response.errorResponse,
      );
      setUserError(userError);
    }
    setLoading(false);
  }
}
