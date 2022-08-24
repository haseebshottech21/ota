import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:ota/utils/routes/routes_name.dart';
import 'package:ota/utils/utils.dart';
import '../repo/auth_repository.dart';
import '../utils/routes/custom_page_router.dart';
import '../pages/home/home_screen.dart';
// import '../utils/routes/routes_name.dart';

class AuthViewModel extends ChangeNotifier {
  final _myRepo = AuthRepository();

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

  Future<void> login(BuildContext context, Function clearFields) async {
    setLoad(true);
    Future.delayed(const Duration(seconds: 3)).then(
      (value) {
        setLoad(false);
        // Navigator.pushNamed(context, RouteName.home);

        clearFields();
        Navigator.of(context).push(
          CustomPageRouter(
            child: const MyHome(),
            direction: AxisDirection.left,
          ),
        );
      },
    );
  }

  Future<void> loginApi(
    dynamic data,
    Function clearFields,
    BuildContext context,
  ) async {
    setLoad(true);
    _myRepo.loginApi(data).then((value) {
      Future.delayed(const Duration(seconds: 3)).then(
        (value) {
          setLoad(false);
          // Navigator.pushNamed(context, RouteName.home);

          // clearFields();
          // Navigator.of(context).push(
          //   CustomPageRouter(
          //     child: const MyHome(),
          //     direction: AxisDirection.left,
          //   ),
          // );

          if (kDebugMode) {
            Utils.successFlushBarMessage(
              value.toString(),
              context,
            );
            print(value.toString());

            clearFields();
            Navigator.of(context).push(
              CustomPageRouter(
                child: const MyHome(),
                direction: AxisDirection.left,
              ),
            );
            // Navigator.of(context).pushNamedAndRemoveUntil(
            //   RouteName.home,
            //   (route) => false,
            // );
          }
        },
      );
    }).onError((error, stackTrace) {
      // setLoad(false);
      if (kDebugMode) {
        Utils.errorFlushBarMessage(error.toString(), context);
        print(error.toString());
      }
    });
  }
}
