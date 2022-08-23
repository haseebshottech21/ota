import 'package:flutter/material.dart';
import 'package:ota/pages/authentication/login.dart';
import 'package:ota/pages/authentication/sign_up.dart';
import 'package:ota/pages/home/home_screen.dart';
import 'package:ota/utils/routes/routes_name.dart';
import '../../pages/intro_screen.dart';

class RouteGenerator {
  static Route<dynamic> onGeneratingRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.intro:
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => const IntroScreen(),
        );
      case RouteName.login:
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => const LoginScreen(),
        );
      case RouteName.signup:
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => const SignupScreen(),
        );
      case RouteName.home:
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => const MyHome(),
        );

      default:
        return errorRoute();
    }
  }

  static Route<dynamic> errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Error'),
            centerTitle: true,
          ),
          body: const Center(
            child: Text('No route defined'),
          ),
        );
      },
    );
  }
}
