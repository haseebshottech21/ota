import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ota/utils/icons.dart';
import 'package:ota/widgets/common/custom_buttons.dart';
import 'package:ota/widgets/common/cached_image.dart';
import 'package:ota/widgets/common/custom_textfields.dart';
import 'package:ota/widgets/common/top_bar.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            topbar(context, 'UPDATE PROFILE'),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                right: 15,
                bottom: 10,
                top: 15,
              ),
              child: Column(
                children: [
                  Center(
                    child: SizedBox(
                      width: 150,
                      height: 150,
                      child: Stack(
                        children: [
                          const Center(
                            child: CachedImageWidget(
                              height: 120,
                              width: 120,
                              radius: 15,
                              imgUrl:
                                  'https://i.pinimg.com/736x/25/78/61/25786134576ce0344893b33a051160b1.jpg',
                            ),
                          ),
                          Positioned(
                            right: 7,
                            bottom: 7,
                            child: Container(
                              // width: 32,
                              // height: 32,
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: const Color(0xFFbc5590).withOpacity(0.6),
                                borderRadius: BorderRadius.circular(6),
                                // border: Border.all(
                                //   color: Colors.white,
                                //   width: 2,
                                // ),
                              ),
                              child: Center(
                                child: Icon(
                                  cameraSolid,
                                  color: Theme.of(context).iconTheme.color,
                                  size: 22,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomTextField(
                    hintText: 'Full Name',
                    controller: fullNameController,
                    node: fullNameFocusNode,
                    icon: Icons.person_outline,
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
                        disbleBtnText: 'Update',
                        widget: authViewModel.loading
                            ? const CupertinoActivityIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                'Update',
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
