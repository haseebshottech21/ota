import 'package:shared_preferences/shared_preferences.dart';

class ThemePrefrence {
  static const themeStatus = 'THEME_STATUS';

  void setTheme(bool value) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool(themeStatus, value);
  }

  Future<bool> getTheme() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(themeStatus) ?? false;
  }
}
