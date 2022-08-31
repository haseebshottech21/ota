import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/common/custom_buttons.dart';
import '../../widgets/common/custom_textfields.dart';
import '../../widgets/common/top_bar.dart';

class UpdatePassword extends StatefulWidget {
  const UpdatePassword({Key? key}) : super(key: key);

  @override
  State<UpdatePassword> createState() => _UpdatePasswordState();
}

class _UpdatePasswordState extends State<UpdatePassword> {
  final currentPassController = TextEditingController();
  final newPassController = TextEditingController();
  final confirmPassController = TextEditingController();

  FocusNode currentPassFocusNode = FocusNode();
  FocusNode newPassFocusNode = FocusNode();
  FocusNode confirmPassFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topbar(context, 'UPDATE PASSWORD'),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 10,
                top: 15,
              ),
              child: Column(
                children: [
                  CustomTextField(
                    hintText: 'Current Password',
                    controller: currentPassController,
                    node: currentPassFocusNode,
                    icon: Icons.lock_outline,
                    passwordField: true,
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                        context,
                        currentPassFocusNode,
                        newPassFocusNode,
                      );
                    },
                  ),
                  CustomTextField(
                    hintText: 'New Password',
                    controller: newPassController,
                    node: newPassFocusNode,
                    icon: Icons.lock_outline,
                    passwordField: true,
                    onFieldSubmitted: (value) {
                      Utils.fieldFocusChange(
                        context,
                        newPassFocusNode,
                        confirmPassFocusNode,
                      );
                    },
                  ),
                  CustomTextField(
                    hintText: 'Confirm Password',
                    controller: confirmPassController,
                    node: confirmPassFocusNode,
                    icon: Icons.lock_outline,
                    passwordField: true,
                  ),
                  const SizedBox(height: 15),
                  Consumer<AuthViewModel>(
                    builder: (context, authViewModel, _) {
                      // print(authViewModel.loading);
                      return ButtonGradient(
                        disbleBtnText: 'Update Password',
                        widget: authViewModel.loading
                            ? const CupertinoActivityIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Update Password',
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
          ],
        ),
      ),
    );
  }
}
