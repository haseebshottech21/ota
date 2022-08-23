import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:ota/constants.dart';
import 'package:ota/pages/authentication/component/auth_bottom.dart';
// import 'package:ota/utils/colors.dart';
import 'package:ota/view_model/auth_view_model.dart';
import 'package:ota/widgets/common/buttons.dart';
import 'package:ota/widgets/common/textfields.dart';
import 'package:ota/widgets/common/fade_in_widget.dart';
import 'package:provider/provider.dart';
import 'package:ota/constants.dart' as constant;

import '../../utils/routes/routes_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = true;
  bool buttonEnable = false;

  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  void initState() {
    super.initState();
    enableButton();
  }

  enableButton() {
    emailController.addListener(() {
      if (passController.text.isNotEmpty) {
        setState(() {
          buttonEnable = emailController.text.isNotEmpty;
        });
      }
    });
    passController.addListener(() {
      if (emailController.text.isNotEmpty) {
        setState(() {
          buttonEnable = passController.text.isNotEmpty;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);
    return Scaffold(
      bottomSheet: AuthBottom(
        title: 'Don\'t have an account?',
        text: 'Sign Up!',
        onTap: () {
          Navigator.of(context).pushNamed(RouteName.signup);
        },
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 70, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FadeInDown(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Welcome to',
                      style: TextStyle(
                        color: Colors.black,
                        // color: Color(0xFF50182c),
                        fontSize: 32,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Serif',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.70,
                      height: MediaQuery.of(context).size.height * 0.10,
                      decoration: const BoxDecoration(
                        // color: Colors.yellow,
                        // borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(constant.logoImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 35),
              MyFadeIn(
                durationSecond: 1,
                child: Column(
                  children: [
                    IconTextfield(
                      hintText: 'Email address',
                      icon: Icons.email_outlined,
                      controller: emailController,
                    ),
                    IconTextfield(
                      hintText: 'Password',
                      icon: Icons.lock_outline,
                      controller: passController,
                      passwordField: true,
                    ),
                    const SizedBox(height: 15),
                    Consumer<AuthViewModel>(
                      builder: (context, authViewModel, _) {
                        // print(authViewModel.loading);
                        return ButtonGradient(
                          buttonEable: buttonEnable,
                          widget: authViewModel.loading
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Log In',
                                  style: Constant.formButtonStyle,
                                ),
                          onPressed: authViewModel.loading
                              ? null
                              : () {
                                  authViewModel.login(context);
                                },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Forgot Password',
                    style: Constant.textButtonStyle,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 0.2,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    'OR',
                    style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 0.2,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Center(
                child: Column(
                  children: [
                    SignInButton(
                      Buttons.GoogleDark,
                      text: "Sign in with Google",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 5),
                    SignInButton(
                      Buttons.Facebook,
                      text: "Sign in with Facebook",
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    passController.dispose();
    super.dispose();
  }
}
