import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:ota/constants.dart';
import 'package:ota/pages/authentication/component/auth_bottom.dart';
import 'package:ota/utils/utils.dart';
import 'package:ota/view_model/auth_view_model.dart';
import 'package:ota/view_model/connection_view_model.dart';
import 'package:provider/provider.dart';
import 'package:ota/constants.dart' as constant;
import '../../widgets/widgets.dart';
import '../../utils/routes/custom_page_router.dart';
import '../../utils/routes/routes_name.dart';
import '../home/home_screen.dart';

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
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.only(top: 50, left: 12, right: 12),
            // color: Colors.yellow,
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
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Serif',
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Image.asset(constant.logoImage),
                      ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.60,
                      //   // height: MediaQuery.of(context).size.height * 0.09,
                      //   padding: const EdgeInsets.symmetric(horizontal: 5),
                      //   alignment: Alignment.centerLeft,
                      //   color: Colors.yellow,

                      //   // decoration: const BoxDecoration(
                      //   // color: Colors.yellow,
                      //   // borderRadius: BorderRadius.circular(10),
                      //   // image: DecorationImage(
                      //   //   image: AssetImage(constant.logoImage),
                      //   //   fit: BoxFit.cover,
                      //   // ),
                      //   // ),
                      //   child: Image.asset(constant.logoImage),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                MyFadeIn(
                  durationSecond: 1,
                  child: Column(
                    children: [
                      CustomTextField(
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
                      CustomTextField(
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
                        // padding: const EdgeInsets.all(4.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        text: "Sign in with Google",
                        onPressed: () {
                          // handleGoogleSignIn();
                        },
                      ),
                      // const SizedBox(height: 5),
                      SignInButton(
                        Buttons.Facebook,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        // padding: const EdgeInsets.all(4.0),
                        text: "Sign in with Facebook",
                        onPressed: () {
                          // handleFacebookSignIn();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // handling google sigin in
  Future handleGoogleSignIn() async {
    final sp = context.read<AuthViewModel>();
    final ip = context.read<ConnectionViewModel>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      Utils.errorFlushBarMessage('Check your Internet Connection!', context);
      // googleController.reset();
    } else {
      await sp.signInWithGoogle().then((value) {
        if (sp.hasError == true) {
          // print(sp.errorCode);
          Utils.errorFlushBarMessage(sp.errorCode.toString(), context);
        } else {
          // checking whether user exists or not
          sp.checkUserExist().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPrefrence()
                  .then((value) => sp.setSignIn().then((value) {
                        // googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPrefrence()
                  .then((value) => sp.setSignIn().then((value) {
                        // googleController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handling google sigin in
  Future handleFacebookSignIn() async {
    final sp = context.read<AuthViewModel>();
    final ip = context.read<ConnectionViewModel>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      Utils.errorFlushBarMessage('Check your Internet Connection!', context);
      // googleController.reset();
    } else {
      await sp.signInWithFacebook().then((value) {
        if (sp.hasError == true) {
          // print(sp.errorCode);
          Utils.errorFlushBarMessage(sp.errorCode.toString(), context);
        } else {
          // checking whether user exists or not
          sp.checkUserExist().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPrefrence()
                  .then((value) => sp.setSignIn().then((value) {
                        // googleController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPrefrence()
                  .then((value) => sp.setSignIn().then((value) {
                        // googleController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
    }
  }

  // handle after signin
  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 500)).then((value) {
      // nextScreenReplace(context, const HomeScreen());
      // Navigator.pushNamed(context, RouteName.login);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const MovieScreen(),
      //   ),
      // );
      Navigator.of(context).push(
        CustomPageRouter(
          child: const MyHome(),
          direction: AxisDirection.left,
        ),
      );
      Utils.loadingFlushBarMessage(
        'Logging Successfully!',
        context,
        color: Colors.green,
      );
    });
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
