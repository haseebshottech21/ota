// IMAGE
import 'package:flutter/material.dart';
import 'package:ota/utils/colors.dart';

const logoImage = "assets/images/logo.png";
const backgroundImage = "assets/images/ota_bg.png";
const earthCircleImage = "assets/images/earthimg.png";

// ERRORS
const userInvalidResponse = 100;
const noInternet = 101;
const invalidFormat = 102;
const unknownError = 103;

// TEXT
// INTRO SCREEN
const String introTitle = 'Outsource Web Design And Development Services';
const String introDescription =
    'To A Well-Known Digital Outsourcing Agency In The United States To Expand Your Business Online. Let\'s Grow As One!';

class Constant {
  static TextStyle formButtonStyle = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    fontSize: 17,
    letterSpacing: 1.0,
  );

  static TextStyle formButtonDisableStyle = const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 17,
    letterSpacing: 1.0,
  );

  static TextStyle textButtonStyle = const TextStyle(
    color: MyColors.mainColor,
    fontWeight: FontWeight.w500,
    fontSize: 15,
    letterSpacing: 0.5,
  );
}
