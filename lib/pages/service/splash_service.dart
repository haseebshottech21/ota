import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ota/utils/routes/routes_name.dart';
import 'package:ota/utils/shared_prefrence.dart';

class SplashService {
  // Future<UserModel> getUserData() => UsersViewModel().getUser();
  final prefrences = Prefrences();

  void checkAuthentication(BuildContext context) async {
    final token = await prefrences.getSharedPreferenceValue('token');
    print('token ' + token.toString());
    if (token == null || token == '') {
      initialization();
    } else {
      // await Future.delayed(const Duration(seconds: 3));
      initialization();
      Navigator.pushNamed(context, RouteName.home);
    }

    // getUserData().then((value) async {
    //   print('Token: ' + value.token.toString());
    //   if (value.token == 'null' || value.token == '') {
    //     // await Future.delayed(const Duration(seconds: 3));
    //     // Navigator.pushNamed(context, RouteName.intro);
    //     initialization();
    //   } else {
    //     await Future.delayed(const Duration(seconds: 3));
    //     Navigator.pushNamed(context, RouteName.home);
    //   }
    // }).onError((error, stackTrace) {
    //   if (kDebugMode) {
    //     print(error.toString());
    //   }
    // });
  }

  void initialization() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    // ignore_for_file: avoid_print
    print('ready in 3...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 2...');
    await Future.delayed(const Duration(seconds: 1));
    print('ready in 1...');
    await Future.delayed(const Duration(seconds: 1));
    print('go!');
    FlutterNativeSplash.remove();
  }
}
