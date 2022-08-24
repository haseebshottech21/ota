import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:ota/constants.dart';
import 'package:ota/pages/authentication/component/auth_bottom.dart';
import 'package:ota/utils/utils.dart';
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
  // bool isLoading = true;
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

  clear() {
    emailController.clear();
    passController.clear();
  }

  // login() {
  //   if (emailController.text.isEmpty) {
  //     Utils.flushBarMessage('Please enter email', context);
  //   } else if (passController.text.isEmpty) {
  //     Utils.flushBarMessage('Please enter password ', context);
  //   } else if (passController.text.length < 6) {
  //     Utils.flushBarMessage('Please enter 6 digit password ', context);
  //   } else {
  //     print('API hit success');
  //     // Map data = {
  //     //   'email': emailController.text.toString(),
  //     //   'password':
  //     //       passController.text.toString(),
  //     // };
  //     authViewModel.login(context, clear);
  //   }
  // }

  FocusNode emailFocusNode = FocusNode();
  FocusNode passFocusNode = FocusNode();

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
          padding: const EdgeInsets.only(top: 60, left: 24, right: 24),
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
                      node: emailFocusNode,
                      icon: Icons.email_outlined,
                      controller: emailController,
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                          context,
                          emailFocusNode,
                          passFocusNode,
                        );
                      },
                    ),
                    IconTextfield(
                      hintText: 'Password',
                      icon: Icons.lock_outline,
                      node: passFocusNode,
                      controller: passController,
                      passwordField: true,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password?',
                          style: Constant.textButtonStyle,
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Consumer<AuthViewModel>(
                      builder: (context, authViewModel, _) {
                        // print(authViewModel.loading);
                        return ButtonGradient(
                          buttonEable: buttonEnable,
                          disbleBtnText: 'Log In',
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
                                  if (emailController.text.isEmpty) {
                                    Utils.errorFlushBarMessage(
                                      'Please enter email',
                                      context,
                                    );
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(emailController.text)) {
                                    Utils.errorFlushBarMessage(
                                      'Please enter valid email address',
                                      context,
                                    );
                                  } else if (passController.text.isEmpty) {
                                    Utils.errorFlushBarMessage(
                                      'Please enter password ',
                                      context,
                                    );
                                  } else if (passController.text.length < 8) {
                                    Utils.errorFlushBarMessage(
                                      'Please enter 8 digit password ',
                                      context,
                                    );
                                  } else {
                                    // print('API hit success');

                                    Map data = {
                                      "email": emailController.text,
                                      "password": passController.text,
                                      // "password": "cityslicka"
                                    };
                                    authViewModel.loginApi(
                                      data,
                                      clear,
                                      context,
                                    );
                                  }
                                },
                        );
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
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
    debugPrint('dispose method');
    emailController.dispose();
    passController.dispose();

    emailFocusNode.dispose();
    passFocusNode.dispose();
    super.dispose();
  }
}
