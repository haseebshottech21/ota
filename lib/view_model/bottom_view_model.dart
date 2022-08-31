import 'package:flutter/material.dart';

class BottomViewModel extends ChangeNotifier {
  int _bottomCurrentIndex = 0;

  int get currentIndex => _bottomCurrentIndex;

  toggleCurrentIndex(int index) {
    _bottomCurrentIndex = index;
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
