import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Utils {
  // Change Focus Node
  static fieldFocusChange(
    BuildContext context,
    FocusNode currentNode,
    FocusNode nextNode,
  ) {
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextNode);
  }

  // TOAST
  static toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  // FLUSHBAR
  static void successFlushBarMessage(
    String message,
    BuildContext context, {
    Color color = Colors.green,
  }) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        padding: const EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(5),
        message: message,
        backgroundColor: color,
        // icon: Icon(Icons.error, color: Colors.deepOrange),
        duration: const Duration(seconds: 3),
      )..show(context),
    );
  }

  static void errorFlushBarMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.TOP,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        padding: const EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(5),
        message: message,
        backgroundColor: Colors.red,
        // icon: Icon(Icons.error, color: Colors.deepOrange),
        duration: const Duration(seconds: 3),
      )..show(context),
    );
  }

  static void loadingFlushBarMessage(
    String message,
    BuildContext context, {
    Color color = Colors.black,
  }) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        flushbarPosition: FlushbarPosition.BOTTOM,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        padding: const EdgeInsets.all(15),
        borderRadius: BorderRadius.circular(5),
        message: message,
        backgroundColor: color,
        // icon: Icon(Icons.error, color: Colors.deepOrange),
        duration: const Duration(seconds: 3),
      )..show(context),
    );
  }

  // static void loadFlushBarMessage(String message, BuildContext context) {
  //   showFlushbar(
  //     context: context,
  //     flushbar: Flushbar(
  //       flushbarPosition: FlushbarPosition.BOTTOM,
  //       forwardAnimationCurve: Curves.decelerate,
  //       margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
  //       padding: const EdgeInsets.all(15),
  //       borderRadius: BorderRadius.circular(5),
  //       // showProgressIndicator: true,
  //       backgroundColor: MyColors.mainColor,
  //       message: message,
  //       // icon: Icon(Icons.error, color: Colors.deepOrange),
  //       // duration: const Duration(seconds: 3),
  //     )..show(context),
  //   );
  // }

  // SNACKBAR
  static void snackBarMessage(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  // DATEFORMAT
  String dateFormat(String date) {
    final inputDate = DateFormat('dd-MM-yy').parse(date);
    // print(inputDate);
    // return outputFormat.format(inputDate);
    return DateFormat('d MMM, yyyy').format(inputDate);
  }
}
