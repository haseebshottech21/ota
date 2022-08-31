import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/common/custom_buttons.dart';
import '../../widgets/common/custom_textfields.dart';
import 'component/auth_bottom.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  // final passController = TextEditingController();
  // final confirmPassController = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: AuthBottom(
        title: 'Already have an account?',
        text: 'Log In!',
        onTap: () {
          Navigator.of(context).pushNamed(RouteName.login);
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Create An Account',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 50, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadeIn(
                duration: const Duration(seconds: 1),
                child: Column(
                  children: [
                    CustomTextField(
                      hintText: 'Full Name',
                      controller: fullNameController,
                      node: fullNameFocusNode,
                      icon: Icons.person,
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                          context,
                          fullNameFocusNode,
                          emailFocusNode,
                        );
                      },
                    ),
                    CustomTextField(
                      hintText: 'Email address',
                      controller: emailController,
                      node: emailFocusNode,
                      icon: Icons.email_outlined,
                      onFieldSubmitted: (value) {
                        Utils.fieldFocusChange(
                          context,
                          emailFocusNode,
                          phoneFocusNode,
                        );
                      },
                    ),
                    CustomTextField(
                      hintText: 'Phone',
                      controller: phoneController,
                      node: phoneFocusNode,
                      icon: Icons.phone,
                    ),
                    const SizedBox(height: 15),
                    Consumer<AuthViewModel>(
                      builder: (context, authViewModel, _) {
                        // print(authViewModel.loading);
                        return ButtonGradient(
                          disbleBtnText: 'Sign Up',
                          widget: authViewModel.loading
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'Sign Up',
                                  style: Constant.formButtonStyle,
                                ),
                          onPressed: authViewModel.loading
                              ? null
                              : () {
                                  // authViewModel.login(context);
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
                      text: "Sign up with Google",
                      onPressed: () {},
                    ),
                    const SizedBox(height: 5),
                    SignInButton(
                      Buttons.Facebook,
                      text: "Sign up with Facebook",
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
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();

    fullNameFocusNode.dispose();
    emailFocusNode.dispose();
    phoneFocusNode.dispose();
    super.dispose();
  }
}
