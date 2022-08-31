import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool _isDarkTheme = false;
  static bool isLoading = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.grey.shade100,
      backgroundColor: Colors.grey.shade300,
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'Work Sans',
      bottomAppBarColor: Colors.white,
      appBarTheme: const AppBarTheme(
        color: Colors.black,
        // backgroundColor: Colors.black,
      ),
      // bottomAppBarTheme: const BottomAppBarTheme(
      //   color: Colors.black,
      // ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          elevation: 4,
          padding: EdgeInsets.zero,
          minimumSize: const Size(32, 32),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.grey.shade100,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade100,
        hintStyle: const TextStyle(color: Colors.black38),
        prefixIconColor: Colors.grey.shade400,
        //   labelStyle: TextStyle(
        //     color: Colors.blue,
        //   ),
        //   focusedBorder: UnderlineInputBorder(
        //     borderSide: BorderSide(
        //       style: BorderStyle.solid,
        //       color: Colors.blue,
        //     ),
        //   ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.black),
        headline2: TextStyle(color: Colors.black),
        bodyText1: TextStyle(color: Colors.black),
        bodyText2: TextStyle(color: Colors.black),
        subtitle1: TextStyle(color: Colors.black),
        subtitle2: TextStyle(color: Colors.black),
        // labelSmall: TextStyle(color: Colors.black12),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.black54,
      backgroundColor: Colors.grey.shade800,
      scaffoldBackgroundColor: Colors.grey.shade900,
      fontFamily: 'Work Sans',
      bottomAppBarColor: Colors.black26,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        // backgroundColor: Colors.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Colors.grey.shade700,
          elevation: 4,
          padding: EdgeInsets.zero,
          minimumSize: const Size(32, 32),
        ),
      ),
      cardTheme: CardTheme(
        color: Colors.grey.shade800,
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.grey.shade800,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIconColor: Colors.grey.shade600,
        //   labelStyle: TextStyle(
        //     color: Colors.blue,
        //   ),
        //   focusedBorder: UnderlineInputBorder(
        //     borderSide: BorderSide(
        //       style: BorderStyle.solid,
        //       color: Colors.blue,
        //     ),
        //   ),
      ),
      iconTheme: const IconThemeData(color: Colors.white),
      textTheme: const TextTheme(
        headline1: TextStyle(color: Colors.white),
        headline2: TextStyle(color: Colors.white),
        bodyText1: TextStyle(color: Colors.white),
        bodyText2: TextStyle(color: Colors.white),
        subtitle1: TextStyle(color: Colors.white),
        subtitle2: TextStyle(color: Colors.white),
        // labelSmall: TextStyle(color: Colors.grey.shade100),
      ),
    );
  }
}
