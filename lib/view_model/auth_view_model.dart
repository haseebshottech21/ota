import 'package:flutter/material.dart';
import '../custom_page_router.dart';
import '../pages/home/home_screen.dart';
// import '../utils/routes/routes_name.dart';

class AuthViewModel extends ChangeNotifier {
  // final _myRepo = AuthRepository();

  bool isRemember = false;
  checkRemeber() {
    isRemember = !isRemember;
    notifyListeners();
  }

  bool _loading = false;
  bool get loading => _loading;
  setLoad(bool status) {
    _loading = status;
    notifyListeners();
  }

  // bool _signupLoading = false;
  // bool get signupLoading => _signupLoading;

  // signUpLoading(bool value) {
  //   _signupLoading = value;
  //   notifyListeners();
  // }

  Future<void> login(BuildContext context) async {
    setLoad(true);
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        setLoad(false);
        // Navigator.pushNamed(context, RouteName.home);
        Navigator.of(context).push(
          CustomPageRouter(
            child: const MyHome(),
            direction: AxisDirection.left,
          ),
        );
      },
    );
  }
}
