import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../utils/routes/routes_name.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/common/buttons.dart';
import '../../widgets/common/fade_in_widget.dart';
import '../../widgets/common/textfields.dart';
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
  final passController = TextEditingController();
  final confirmPassController = TextEditingController();

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
        title: const Text('Create An Account'),
      ),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyFadeIn(
                durationSecond: 1,
                child: Column(
                  children: [
                    IconTextfield(
                      hintText: 'Full Name',
                      icon: Icons.person,
                      controller: fullNameController,
                    ),
                    IconTextfield(
                      hintText: 'Phone',
                      icon: Icons.phone,
                      controller: phoneController,
                    ),
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
                    IconTextfield(
                      hintText: 'Password',
                      icon: Icons.lock_outline,
                      controller: confirmPassController,
                      passwordField: true,
                    ),
                    const SizedBox(height: 15),
                    Consumer<AuthViewModel>(
                      builder: (context, authViewModel, _) {
                        // print(authViewModel.loading);
                        return ButtonGradient(
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
                                  authViewModel.login(context);
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
}
