import 'package:flutter/material.dart';
import 'package:ota/widgets/common/buttons.dart';
import 'package:ota/widgets/common/textfields.dart';
import 'package:ota/widgets/common/top_bar.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topbar(context, 'CHANGE PASSWORD'),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
                child: Column(
                  children: [
                    IconTextfield(
                      hintText: 'Current Password',
                      icon: Icons.lock_outline,
                      controller: controller,
                      passwordField: true,
                    ),
                    IconTextfield(
                      hintText: 'New Password',
                      icon: Icons.lock_outline,
                      controller: controller,
                      passwordField: true,
                    ),
                    IconTextfield(
                      hintText: 'Confirm Password',
                      icon: Icons.lock_outline,
                      controller: controller,
                      passwordField: true,
                    ),
                    const SizedBox(height: 15),
                    ButtonGradient(
                      widget: const Text(
                        'UPDATE PASSWORD',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          letterSpacing: 2.0,
                        ),
                      ),
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
