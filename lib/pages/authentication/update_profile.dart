import 'package:flutter/material.dart';
import 'package:ota/utils/icons.dart';
import 'package:ota/widgets/common/buttons.dart';
import 'package:ota/widgets/common/cached_image.dart';
import 'package:ota/widgets/common/textfields.dart';
import 'package:ota/widgets/common/top_bar.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              topbar(context, 'UPDATE PROFILE'),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
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
                            // ),
                            Positioned(
                              right: 7,
                              bottom: 7,
                              child: Container(
                                // width: 32,
                                // height: 32,
                                padding: const EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                  color:
                                      const Color(0xFFbc5590).withOpacity(0.6),

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
                    Center(
                      child: Text(
                        'Bessie Cooper',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          // color: Color(0xFF50182c),
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Center(
                      child: Text(
                        'CEO COMPANY',
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyText1!.color,
                          // color: Color(0xFF50182c),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    IconTextfield(
                      hintText: 'Name',
                      icon: Icons.person_outline,
                      controller: controller,
                    ),
                    IconTextfield(
                      hintText: 'Email address',
                      icon: Icons.email_outlined,
                      controller: controller,
                    ),
                    IconTextfield(
                      hintText: 'Phone Number',
                      icon: Icons.phone_outlined,
                      controller: controller,
                    ),
                    IconTextfield(
                      hintText: 'Password',
                      icon: Icons.lock_outline,
                      controller: controller,
                      passwordField: true,
                    ),
                    const SizedBox(height: 15),
                    ButtonGradient(
                      widget: const Text(
                        'UPDATE',
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
