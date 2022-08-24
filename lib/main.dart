import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:ota/utils/routes/custom_page_router.dart';
import 'package:ota/pages/authentication/change_password.dart';
import 'package:ota/pages/authentication/update_profile.dart';
import 'package:ota/pages/home/home_screen.dart';
import 'package:ota/pages/intro_screen.dart';
import 'package:ota/pages/profile/notifications.dart';
import 'package:ota/pages/profile/profile_screen.dart';
import 'package:ota/pages/projects/create_project.dart';
import 'package:ota/pages/projects/project_detail.dart';
import 'package:ota/themes.dart';
import 'package:ota/utils/routes/routes.dart';
import 'package:ota/utils/routes/routes_name.dart';
import 'package:ota/view_model/auth_view_model.dart';
import 'package:ota/view_model/user_view_model.dart';
import 'package:ota/widgets/common/full_body_textfield.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UsersViewModel()),
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
        home: const MyHome(),
        initialRoute: RouteName.intro,
        onGenerateRoute: RouteGenerator.onGeneratingRoute,
        // routes: {
        //   // '/intro': (context) => const IntroScreen(),
        //   // '/login': (context) => const LoginScreen(),
        //   // '/update-profile': (context) => const UpdateProfile(),
        //   // '/home': (context) => const MyHome(),
        //   // '/profile': (context) => const ProfileScreen(),
        //   // '/notification': (context) => const NotificationScreen(),
        //   // '/project-detail': (context) => const ProjectDetailScreen(),
        // },
      ),
    );
  }

  static Route generatingRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/intro':
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (ctx) => const IntroScreen(),
      //   );
      // case '/login':
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (ctx) => const LoginScreen(),
      //   );
      // case '/home':
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (ctx) => const MyHome(),
      //   );
      case '/profile':
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => const ProfileScreen(),
        );
      case '/project-detail':
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => const ProjectDetailScreen(),
        );
      // case '/create-project':
      //   return CustomPageRouter(
      //     child: const CreateProject(),
      //     settings: settings,
      //     direction: AxisDirection.down,
      //     milisecond: 200,
      //   );
      case '/create':
        return CustomPageRouter(
          child: const CreateProject(),
          settings: settings,
          direction: AxisDirection.up,
          milisecond: 300,
        );
      case '/project-field':
        return CustomPageRouter(
          child: const TextfieldFullBody(),
          settings: settings,
          direction: AxisDirection.up,
          milisecond: 200,
        );
      case '/notification':
        return CustomPageRouter(
          child: const NotificationScreen(),
          settings: settings,
          direction: AxisDirection.left,
          milisecond: 200,
        );
      case '/update-profile':
        return CustomPageRouter(
          child: const UpdateProfile(),
          settings: settings,
          direction: AxisDirection.left,
          milisecond: 200,
        );
      case '/change-password':
        return CustomPageRouter(
          child: const ChangePassword(),
          settings: settings,
          direction: AxisDirection.left,
          milisecond: 200,
        );
      // case '/notfication':
      //   return CustomPageRouter(
      //     child: const UpdateProfile(),
      //     settings: settings,
      //     // direction: AxisDirection.left,
      //     // milisecond: 200,
      //   );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => const IntroScreen(),
        );
    }
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
