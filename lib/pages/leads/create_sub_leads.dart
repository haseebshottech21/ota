import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ota/view_model/subleads_view_model.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../utils/shared_prefrence.dart';
import '../../utils/utils.dart';
import '../../widgets/common/custom_buttons.dart';
import '../../widgets/common/custom_textfields.dart';

class CreateSubLead extends StatefulWidget {
  const CreateSubLead({Key? key}) : super(key: key);

  @override
  State<CreateSubLead> createState() => _CreateSubLeadState();
}

class _CreateSubLeadState extends State<CreateSubLead> {
  final prefrences = Prefrences();
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  // final passController = TextEditingController();
  // final confirmPassController = TextEditingController();

  FocusNode fullNameFocusNode = FocusNode();
  FocusNode emailFocusNode = FocusNode();
  FocusNode phoneFocusNode = FocusNode();

  void createSubLead(BuildContext context) async {
    // final userId = await prefrences.getSharedPreferenceValue('user_id');
    final subLeadViewModel =
        Provider.of<LeadsViewModel>(context, listen: false);
    Map data = {
      "name": fullNameController.text,
      "email": emailController.text,
      "phone": phoneController.text,
      // "role_id": '5',
      // "user_id": userId,
    };
    // print(data);
    subLeadViewModel.createSubLeadApi(data, clear, context);
  }

  clear() {
    fullNameController.clear();
    emailController.clear();
    phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create New Sub Lead',
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyText1!.color,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.clear, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        automaticallyImplyLeading: true,
      ),
      body: _uiBody(context),
    );
  }

  _uiBody(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.only(top: 16, left: 24, right: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeIn(
              duration: const Duration(seconds: 1),
              child: Column(
                children: [
                  const SizedBox(height: 5),
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
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(11),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Consumer<LeadsViewModel>(
                    builder: (context, leadViewModel, _) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(6.0, 4.0, 6.0, 4.0),
                        child: PostButton(
                          widget: leadViewModel.loading
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  'CREATE',
                                  style: Constant.formButtonStyle,
                                ),
                          onPressed: leadViewModel.loading
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
                                  } else if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(emailController.text)) {
                                    Utils.errorFlushBarMessage(
                                      'Please enter valid email address',
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
                                    createSubLead(context);
                                  }
                                },
                        ),
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
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }
}
