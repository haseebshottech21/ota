import 'package:shared_preferences/shared_preferences.dart';

class Prefrences {
  Future<dynamic> getSharedPreferenceValue(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getString(key);
  }

  Future<void> setSharedPreferenceValue(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString(key, value);
  }

  // Future<void> removeSharedPreferenceValue(String key) async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   preferences.remove(key);
  // }

  Future<dynamic> removeSharedPreferenceValue(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.remove(key);
  }
}
