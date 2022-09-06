import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ota/utils/icons.dart';
import 'package:provider/provider.dart';
import '../../constants.dart';
import '../../utils/routes/routes_name.dart';
import '../../utils/utils.dart';
import '../../view_model/auth_view_model.dart';
import '../../widgets/widgets.dart';
import 'component/auth_bottom.dart';
import 'component/select_profile.dart';

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

  bool buttonEnable = false;

  @override
  void initState() {
    super.initState();
    enableButton();
  }

  clear() {
    fullNameController.clear();
    emailController.clear();
    phoneController.clear();
  }

  enableButton() {
    fullNameController.addListener(() {
      if (emailController.text.isNotEmpty && phoneController.text.isNotEmpty) {
        setState(() {
          buttonEnable = fullNameController.text.isNotEmpty;
        });
      }
    });
    emailController.addListener(() {
      if (phoneController.text.isNotEmpty &&
          fullNameController.text.isNotEmpty) {
        setState(() {
          buttonEnable = emailController.text.isNotEmpty;
        });
      }
    });
    phoneController.addListener(() {
      if (emailController.text.isNotEmpty &&
          fullNameController.text.isNotEmpty) {
        setState(() {
          buttonEnable = phoneController.text.isNotEmpty;
        });
      }
    });
  }

  File? _image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await cropImage(imageFile: img);
      setState(() {
        _image = img;
        Navigator.of(context).pop();
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

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
                  GestureDetector(
                    onTap: () => _showSelectPhoto(context),
                    child: Center(
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Stack(
                          children: [
                            Center(
                              child: Container(
                                height: 120,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(15),
                                  image: _image == null
                                      ? const DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            'https://static.vecteezy.com/system/resources/thumbnails/005/228/939/small_2x/avatar-man-face-silhouette-user-sign-person-profile-picture-male-icon-black-color-illustration-flat-style-image-vector.jpg',
                                          ),
                                        )
                                      : DecorationImage(
                                          fit: BoxFit.cover,
                                          image: FileImage(_image!),
                                        ),
                                ),
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
                                  color: Colors.grey.shade500.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Center(
                                  child: Icon(
                                    cameraSolid,
                                    color: Theme.of(context).iconTheme.color,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
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
                  Consumer<AuthViewModel>(
                    builder: (context, authViewModel, _) {
                      // print(authViewModel.loading);
                      return ButtonGradient(
                        buttonEable: buttonEnable,
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
                                  print('API hit success');
                                  Map data = {
                                    "name": fullNameController.text,
                                    "email": emailController.text,
                                    "phone": phoneController.text,
                                    "role_id": '4',
                                  };
                                  authViewModel.signUpApi(
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
    );
  }

  void _showSelectPhoto(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.22,
        maxChildSize: 0.26,
        minChildSize: 0.22,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 10,
                  child: Container(
                    width: 50,
                    height: 4,
                    // margin: const EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.5),
                      color: Colors.black54,
                    ),
                  ),
                ),
                // const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Column(
                    children: [
                      SelectPhoto(
                        // onTap: () {},
                        onTap: () => pickImage(ImageSource.gallery),
                        textLabel: 'Select from Gallery',
                        icon: Icons.image,
                      ),
                      // const SizedBox(height: 5),
                      SelectPhoto(
                        // onTap: () {},
                        onTap: () => pickImage(ImageSource.camera),
                        textLabel: 'Select from Camera',
                        icon: Icons.camera_alt_outlined,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
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
