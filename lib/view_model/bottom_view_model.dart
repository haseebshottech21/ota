import 'package:flutter/material.dart';

class BottomViewModel extends ChangeNotifier {
  int bottomCurrentIndex = 0;

  int get currentIndex => bottomCurrentIndex;

  toggleCurrentIndex(int index) {
    bottomCurrentIndex = index;
    notifyListeners();
  }
}

  // bool _loading = false;
  // bool get loading => _loading;
  // setLoad(bool status) {
  //   _loading = status;
  //   notifyListeners();
  // }



// int bottomNavBarCurrentIndex = 0;

// toggleCurrentIndex(int index) {
//   bottomNavBarCurrentIndex = index;
//   setState(() {});
// }
