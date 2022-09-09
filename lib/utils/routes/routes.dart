import 'package:flutter/material.dart';
// import 'package:ota/model/project_model.dart';
import 'package:ota/pages/authentication/login.dart';
import 'package:ota/pages/authentication/sign_up.dart';
import 'package:ota/pages/home/home_screen.dart';
import 'package:ota/pages/leads/sub_lead_detail.dart';
import 'package:ota/pages/profile/notifications.dart';
import 'package:ota/pages/profile/update_password.dart';
import 'package:ota/pages/projects/create_project.dart';
import 'package:ota/pages/projects/project_detail.dart';
import 'package:ota/utils/routes/routes_name.dart';
import '../../pages/profile/update_profile.dart';
import '../../pages/intro_screen.dart';
import '../../widgets/common/full_body_textfield.dart';
import 'custom_page_router.dart';

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
      case RouteName.projectDetail:
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => const ProjectDetail(),
        );
      // SUB LEAD
      case RouteName.subLeadDetail:
        return MaterialPageRoute(
          settings: settings,
          builder: (ctx) => const SubLeadDetail(),
        );
      // CREATE
      case RouteName.createProject:
        return CustomPageRouter(
          child: const CreateProject(),
          settings: settings,
          direction: AxisDirection.up,
          milisecond: 300,
        );
      // case RouteName.projectField:
      //   return CustomPageRouter(
      //     child: TextfieldFullBody(),
      //     settings: settings,
      //     direction: AxisDirection.up,
      //     milisecond: 200,
      //   );
      // PROFILE
      case RouteName.updateMyProfile:
        // return MaterialPageRoute(
        //   settings: settings,
        //   builder: (ctx) => const UpdateProfile(),
        // );
        return CustomPageRouter(
          child: const UpdateProfile(),
          settings: settings,
          direction: AxisDirection.left,
          milisecond: 200,
        );
      case RouteName.notification:
        // return MaterialPageRoute(
        //   settings: settings,
        //   builder: (ctx) => const NotificationScreen(),
        // );
        return CustomPageRouter(
          child: const NotificationScreen(),
          settings: settings,
          direction: AxisDirection.left,
          milisecond: 200,
        );
      case RouteName.updatePassword:
        // return MaterialPageRoute(
        //   settings: settings,
        //   builder: (ctx) => const UpdatePassword(),
        // );
        return CustomPageRouter(
          child: const UpdatePassword(),
          settings: settings,
          direction: AxisDirection.left,
          milisecond: 200,
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
