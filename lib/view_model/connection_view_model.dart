import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class ConnectionViewModel extends ChangeNotifier {
  bool _hasInternet = false;

  bool get hasInternet => _hasInternet;

  ConnectionViewModel() {
    checkInternetConnection();
  }

  Future checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      _hasInternet = false;
    } else {
      _hasInternet = true;
    }
    notifyListeners();
  }
}
