import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ota/utils/icons.dart';
import 'package:ota/widgets/common/custom_buttons.dart';
import 'package:ota/widgets/common/cached_image.dart';
import 'package:ota/widgets/common/custom_textfields.dart';
import 'package:ota/widgets/common/top_bar.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../utils/shared_prefrence.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final prefrences = Prefrences();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();

  bool buttonEnable = true;

  @override
  void initState() {
    getProfileValues();
    super.initState();
  }

  getProfileValues() async {
    final name = await prefrences.getSharedPreferenceValue('name');
    final email = await prefrences.getSharedPreferenceValue('email');
    final phone = await prefrences.getSharedPreferenceValue('phone');

    fullNameController.text = name;
    emailController.text = email;
    phoneController.text = phone;
  }

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
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Consumer<AuthViewModel>(
                    builder: (context, authViewModel, _) {
                      // print(authViewModel.loading);
                      return ButtonGradient(
                        buttonEable: buttonEnable,
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
                                if (fullNameController.text.isEmpty) {
                                  Utils.errorFlushBarMessage(
                                    'Please enter full name',
                                    context,
                                  );
                                } else if (emailController.text.isEmpty) {
                                  Utils.errorFlushBarMessage(
                                    'Please enter email',
                                    context,
                                  );
                                } else if (phoneController.text.isEmpty) {
                                  Utils.errorFlushBarMessage(
                                    'Please enter phone number ',
                                    context,
                                  );
                                } else if (phoneController.text.length < 10) {
                                  Utils.errorFlushBarMessage(
                                    'Please enter 10 digit phone number ',
                                    context,
                                  );
                                } else {
                                  // print('API hit success');
                                  Map data = {
                                    "name": fullNameController.text,
                                    "phone": phoneController.text,
                                  };
                                  authViewModel.updateProfileApi(
                                    data,
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
