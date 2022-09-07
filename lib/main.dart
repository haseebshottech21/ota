import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
// import 'package:ota/pages/home/home_screen.dart';
import 'package:ota/themes.dart';
import 'package:ota/utils/routes/routes.dart';
import 'package:ota/utils/routes/routes_name.dart';
import 'package:ota/view_model/auth_view_model.dart';
import 'package:ota/view_model/bottom_view_model.dart';
import 'package:ota/view_model/categories_view_model.dart';
import 'package:ota/view_model/connection_view_model.dart';
import 'package:ota/view_model/home_view_model.dart';
import 'package:ota/view_model/project_view_model.dart';
import 'package:ota/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    currentTheme.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return ChangeNotifierProvider<ThemeProvider>(
    //   create: (_) => ThemeProvider(),
    //   child: Consumer<ThemeProvider>(
    //     builder: (context, value, child) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => CategoriesViewModel()),
        ChangeNotifierProvider(create: (_) => ProjectViewModel()),
        ChangeNotifierProvider(create: (_) => BottomViewModel()),
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
        ChangeNotifierProvider(create: (_) => UsersViewModel()),
        ChangeNotifierProvider(create: (_) => ConnectionViewModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        // theme: ThemeData(
        //   primarySwatch: Palette.reddishPink,
        // ),
        theme: CustomTheme.lightTheme,
        darkTheme: CustomTheme.darkTheme,
        themeMode: currentTheme.currentTheme,
        // home: const MyHome(),
        initialRoute: RouteName.intro,
        onGenerateRoute: RouteGenerator.onGeneratingRoute,
      ),
    );
  }
}

class Palette {
  // this basically makes it so you can instantiate this class
  static const _otaPrimaryValue = 0xFF8E4E65;

  static const MaterialColor reddishPink = MaterialColor(
    _otaPrimaryValue,
    <int, Color>{
      50: Color(0xFFF1E9EC),
      100: Color(0xFFE3D3D9),
      200: Color(0xFFD5BDC5),
      300: Color(0xFFC7A7B2),
      400: Color(0xFFB9919F),
      500: Color(0xFFAA7A8C),
      600: Color(0xFF9C6479),
      700: Color(_otaPrimaryValue),
      800: Color(0xFF803852),
      900: Color(0xFF72223F),
    },
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
